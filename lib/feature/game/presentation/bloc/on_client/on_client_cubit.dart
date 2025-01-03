import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/services/game/models/message_model.dart';
import 'package:spies/core/services/game/server_service.dart';
import 'package:spies/feature/game/data/models/player_model.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/locator.dart';

part 'on_client_state.dart';

class OnClientCubit extends Cubit<OnClientState> {
  final ServerService serverService;
  OnClientCubit({required this.serverService}) : super(const OnClientState());

  void listenClientData() {
    serverService.onClientLeft.stream.listen((_) {
      for (var player in state.players) {
        if (player.port != null) serverService.send(player.port!, MessageModel(type: MessageTypeEnum.check));
      }
    });
    serverService.onClientData.stream.listen((model) {
      final broadcastModel = MessageModel.fromJson(model.data);
      log('onClientData.broadcastModel: ${broadcastModel.toMap()}');

      final type = broadcastModel.type.name;

      if (type == MessageTypeEnum.disconnectGame.name) removePlayer(model.client);
      if (type == MessageTypeEnum.connectGame.name) {
        addPlayer(
          PlayerModel(
            ip: model.client.address.address,
            port: model.client.remotePort,
            name: broadcastModel.name,
          ),
        );
      }

      if (type == MessageTypeEnum.suggestWord.name) {
        sl<GameBloc>().add(GameOnSuggestWordEvent(
          word: broadcastModel.word,
          port: model.client.remotePort,
        ));
      }
    });
  }

  void addPlayer(PlayerModel player) {
    if (state.players.firstWhereOrNull((element) => element.port == player.port) != null) return;
    emit(state.copyWith(players: [...state.players, player]));
  }

  void removePlayer(Socket client) {
    List<PlayerModel> players = [...state.players];

    if (players.firstWhereOrNull((element) => element.port == client.remotePort) == null) return;
    players.removeWhere((element) => element.port == client.remotePort);
    emit(state.copyWith(players: players));
  }

  void removePlayerForce(int port) {
    List<PlayerModel> players = [...state.players];
    players.removeWhere((element) => element.port == port);
    emit(state.copyWith(players: players));
  }

  void clearPlayers() => emit(state.copyWith(players: []));
}
