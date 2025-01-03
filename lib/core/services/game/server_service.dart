import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:client_server_sockets/client_server_sockets.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:spies/core/services/game/models/clien_data_model.dart';
import 'package:spies/core/services/game/models/clien_error_model.dart';
import 'package:spies/core/services/game/models/message_model.dart';
import 'package:spies/feature/game/presentation/bloc/on_client/on_client_cubit.dart';
import 'package:spies/locator.dart';

class ServerService {
  final StreamController<ClienDataModel> onClientData = StreamController();
  final StreamController<ClienErrorModel> onClientError = StreamController();
  final StreamController<Socket> onClientLeft = StreamController();
  final StreamController<Socket> onNewClient = StreamController();
  final StreamController<String> onServerError = StreamController();

  String? currentIp;

  Future<String?> start() async {
    String? currentIp;
    try {
      await Server.instance.start(
        onClientData: (client, data) => onClientData.add(ClienDataModel(client: client, data: data)),
        onClientError: (client, error) => onClientError.add(ClienErrorModel(client: client, error: error)),
        onClientLeft: (client) => onClientLeft.add(client),
        onNewClient: (client) => onNewClient.add(client),
        onServerError: (error) => onServerError.add(error),
      );
      currentIp = await NetworkInfo().getWifiIP();
    } catch (e) {
      log('error: $e');
    }
    return currentIp;
  }

  void stop() {
    try {
      Server.instance.stop();
      currentIp = null;
    } catch (e) {
      log('error: $e');
    }
  }

  void sendAll(MessageModel message) {
    try {
      Server.instance.broadcast(message.toJson());
      currentIp = null;
    } catch (e) {
      log('error: $e');
    }
  }

  void send(int port, MessageModel message) {
    try {
      Server.instance.sendTo(port, message.toJson());
      currentIp = null;
    } catch (e) {
      sl<OnClientCubit>().removePlayerForce(port);
      log('error: $e');
    }
  }
}
