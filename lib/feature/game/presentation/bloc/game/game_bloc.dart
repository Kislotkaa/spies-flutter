import 'dart:math';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/constants/dataset.dart';
import 'package:spies/core/constants/enums.dart';
import 'package:spies/core/models/snackbar_model.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/router/app_router.gr.dart';
import 'package:spies/core/services/game/client_service.dart';
import 'package:spies/core/services/game/models/message_model.dart';
import 'package:spies/core/services/game/server_service.dart';
import 'package:spies/core/widgets/app_snackbar.dart';
import 'package:spies/feature/game/data/models/game_initial_params.dart';
import 'package:spies/feature/game/data/models/player_model.dart';
import 'package:spies/feature/game/data/models/suggest_model.dart';
import 'package:spies/feature/game/presentation/bloc/on_client/on_client_cubit.dart';
import 'package:spies/locator.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ServerService serverService;
  final ClientService clientService;

  GameBloc({
    required this.serverService,
    required this.clientService,
  }) : super(const GameState.initial()) {
    on<GameInitEvent>(
      (event, emit) async {
        sl<OnClientCubit>().addPlayer(PlayerModel(
          ip: event.params.ip,
          name: event.params.myName,
          port: null,
        ));

        emit(
          state.copyWith(
            gameInitialParams: event.params,
            status: StateStatus.initial,
            gameStatus: GameStatusEnum.initial,
            currentWord: null,
          ),
        );
      },
    );

    on<GameStopEvent>(
      (event, emit) async {
        if (state.gameInitialParams?.role == GameRoleEnum.host) {
          serverService.stop();
        }
        if (state.gameInitialParams?.role == GameRoleEnum.client) {
          clientService.send(MessageModel(type: MessageTypeEnum.disconnectGame));
          clientService.disconnect();
        }
        sl<OnClientCubit>().clearPlayers();
        router.replaceAll([HomeRoute()]);
      },
    );

    on<GameKickedFromServerEvent>(
      (event, emit) async {
        if (state.gameInitialParams?.role == GameRoleEnum.client) {
          emit(
            state.copyWith(
              gameInitialParams: state.gameInitialParams,
              currentWord: state.currentWord,
              snackbar: SnackbarModel(
                title: 'Игра окончена...',
                description: 'Ведущий закончил игровую сессию!',
                status: SnackStatusEnum.warning,
              ),
            ),
          );

          clientService.disconnect();

          router.replaceAll([HomeRoute()]);
        }
      },
    );

    on<GameStartEvent>(
      (event, emit) async {
        if (state.gameInitialParams?.role == GameRoleEnum.host) {
          late String currentWord;
          PlayerModel? spies;
          List<PlayerModel> roleSpiers = [...sl<OnClientCubit>().state.players]; // ТЕ КТО МОГУТ БЫТЬ ШПИОНАМИ
          List<PlayerModel> players = [...sl<OnClientCubit>().state.players]; // ВСЕ ИГРОКИ

          if (event.sugest != null) {
            currentWord = event.sugest!.word;
            roleSpiers.removeWhere((element) => element.port == event.sugest?.portPlayer);
          } else {
            final listCount = dataset[Random().nextInt(dataset.length)];
            currentWord = listCount[Random().nextInt(listCount.length)];
          }

          spies ??= roleSpiers[Random().nextInt(roleSpiers.length)];
          players.removeWhere((element) => element.port == spies?.port);

          for (final player in players) {
            if (player.port != null) {
              serverService.send(
                player.port!,
                MessageModel(type: MessageTypeEnum.startGame, word: currentWord),
              );
            }
          }

          if (spies.port != null) {
            serverService.send(
              spies.port!,
              MessageModel(type: MessageTypeEnum.startGame, word: 'Шпион'),
            );
          } else {
            currentWord = 'Шпион';
          }

          emit(
            state.copyWith(
              gameStatus: GameStatusEnum.process,
              status: StateStatus.success,
              gameInitialParams: state.gameInitialParams,
              currentWord: currentWord,
            ),
          );
        }
      },
    );

    on<GameSuggestWordEvent>(
      (event, emit) async {
        if (event.word?.isEmpty == true) return;
        clientService.send(MessageModel(
          type: MessageTypeEnum.suggestWord,
          word: event.word,
        ));
      },
    );

    on<GameOnSuggestWordEvent>(
      (event, emit) async {
        if (event.word != null && event.port != null) {
          final player = sl<OnClientCubit>().state.players.firstWhereOrNull((element) => element.port == event.port);
          emit(
            state.copyWith(
              status: StateStatus.success,
              gameInitialParams: state.gameInitialParams,
              currentWord: event.word,
              snackbar: SnackbarModel(
                title: 'Игрок ${player?.name} предложил слово!',
                description: 'Нажмите кнопку что бы начать раунд с этим словом!',
                status: SnackStatusEnum.access,
                duration: Duration(seconds: 8),
                onTap: () => sl<GameBloc>().add(
                  GameStartEvent(
                    sugest: SuggestModel(
                      word: event.word!,
                      portPlayer: event.port!,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );

    on<GameNewRoundEvent>(
      (event, emit) async {
        if (state.gameInitialParams?.role == GameRoleEnum.client) {
          emit(
            state.copyWith(
              gameStatus: GameStatusEnum.process,
              status: StateStatus.success,
              gameInitialParams: state.gameInitialParams,
              currentWord: event.word,
              snackbar: SnackbarModel(
                title: 'Новый раунд!',
                description: 'Ведущий начал новый раунд!',
                status: SnackStatusEnum.access,
              ),
            ),
          );
        }
      },
    );
  }
}
