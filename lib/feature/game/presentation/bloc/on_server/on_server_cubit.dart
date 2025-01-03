import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/services/game/client_service.dart';
import 'package:spies/core/services/game/models/message_model.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/locator.dart';

class OnServerCubit extends Cubit<bool> {
  final ClientService clientService;
  OnServerCubit({required this.clientService}) : super(true);

  void listenServerData() {
    clientService.onServerData.stream.listen((data) {
      final broadcastModel = MessageModel.fromJson(data);
      log('onServerData.broadcastModel: ${broadcastModel.toMap()}');

      final type = broadcastModel.type.name;
      if (type == MessageTypeEnum.startGame.name) {
        sl<GameBloc>().add(GameNewRoundEvent(word: broadcastModel.word));
      }
    });
    clientService.onServerStopped.stream.listen((data) {
      sl<GameBloc>().add(GameKickedFromServerEvent());
    });
  }
}
