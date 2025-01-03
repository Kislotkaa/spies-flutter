import 'dart:async';
import 'dart:developer';

import 'package:client_server_sockets/client_server_sockets.dart';
import 'package:spies/core/services/game/models/message_model.dart';

class ClientService {
  final StreamController<String> onClientError = StreamController();
  final StreamController<String> onServerData = StreamController();
  final StreamController<String> onServerError = StreamController();
  final StreamController<void> onServerStopped = StreamController();

  Future<bool> connect(String ip) async {
    bool flag = false;
    try {
      flag = await Client.instance.connect(
        ip,
        onClientError: (error) => onClientError.add(error),
        onServerData: (data) => onServerData.add(data),
        onServerError: (error) => onServerError.add(error),
        onServerStopped: () => onServerStopped.add(null),
      );
    } catch (e) {
      log('error: $e');
    }
    return flag;
  }

  void disconnect() {
    try {
      Client.instance.disconnect();
    } catch (e) {
      log('error: $e');
    }
  }

  void send(MessageModel message) {
    try {
      Client.instance.send(message.toJson());
    } catch (e) {
      log('error: $e');
    }
  }
}
