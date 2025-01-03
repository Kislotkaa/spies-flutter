import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/constants/enums.dart';
import 'package:spies/core/models/snackbar_model.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/router/app_router.gr.dart';
import 'package:spies/core/services/game/client_service.dart';
import 'package:spies/core/services/game/models/message_model.dart';
import 'package:spies/core/services/game/repository/theme_repository.dart';
import 'package:spies/core/services/game/server_service.dart';
import 'package:spies/core/widgets/app_snackbar.dart';
import 'package:spies/feature/game/data/models/game_initial_params.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;
  final ClientService clientService;
  final ServerService serverService;

  HomeBloc({
    required this.userRepository,
    required this.clientService,
    required this.serverService,
  }) : super(const HomeState.initial()) {
    on<HomeCreateGameEvent>((event, emit) async {
      if (state.status == StateStatus.loading) return;

      emit(
        state.copyWith(
          status: StateStatus.loading,
        ),
      );

      final ip = await serverService.start();
      if (ip == null) {
        emit(
          state.copyWith(
            snackbar: SnackbarModel(
              title: 'Wifi сеть не обнаружена',
              description: 'Что бы создать игру, необходимы подключиться к Wifi сети',
              status: SnackStatusEnum.normal,
            ),
            status: StateStatus.failure,
          ),
        );
        return serverService.stop();
      }

      sl<GameBloc>().add(GameInitEvent(GameInitialParams(
        ip: ip,
        role: GameRoleEnum.host,
        myName: 'Я',
      )));

      router.replaceAll([GameRoute()]);

      emit(
        state.copyWith(
          status: StateStatus.success,
        ),
      );
    });

    on<HomeConnectGameEvent>(
      (event, emit) async {
        if (state.status == StateStatus.loading) return;

        emit(
          state.copyWith(
            status: StateStatus.loading,
          ),
        );

        int validValue = 0;
        event.ip.split('.').forEach((value) {
          if (int.tryParse(value) is int) validValue++;
        });

        if (validValue != 4) {
          emit(
            state.copyWith(
              snackbar: SnackbarModel(
                title: 'Такой IP не найден',
                description: 'А извините, но вы к кому подключаетесь?',
                status: SnackStatusEnum.warning,
              ),
              status: StateStatus.failure,
            ),
          );
          return;
        }

        if (event.playerName.isEmpty == true) {
          emit(
            state.copyWith(
              snackbar: SnackbarModel(
                title: 'Имя не заполнено',
                description: 'Ты кто? Я тебя не знаю',
                status: SnackStatusEnum.warning,
              ),
              status: StateStatus.failure,
            ),
          );
          return;
        }

        userRepository.setUserName(event.playerName);
        userRepository.setLastIp(event.ip);

        final flag = await clientService.connect(event.ip);

        if (flag == false) {
          emit(
            state.copyWith(
              snackbar: SnackbarModel(
                title: 'Не удалось подключиться к серверу',
                description: 'Сервер по указанному IP не был найден, проверьте правильность ввода и повторите попытку',
                status: SnackStatusEnum.warning,
              ),
              status: StateStatus.failure,
            ),
          );
          return;
        }

        clientService.send(MessageModel(type: MessageTypeEnum.connectGame, name: event.playerName));

        sl<GameBloc>().add(GameInitEvent(GameInitialParams(
          ip: event.ip,
          role: GameRoleEnum.client,
          myName: event.playerName,
        )));

        router.replaceAll([GameRoute()]);

        emit(
          state.copyWith(
            status: StateStatus.success,
          ),
        );
      },
    );
    on<HomeWhereIsConnectEvent>(
      (event, emit) async {
        if (state.status == StateStatus.loading) return;

        final ip = userRepository.getLastIp();
        final name = userRepository.getUserName();

        router.push(WhereIsConnectRoute(ipInitial: ip, nameInitial: name));

        emit(
          state.copyWith(
            status: StateStatus.success,
          ),
        );
      },
    );
  }
}
