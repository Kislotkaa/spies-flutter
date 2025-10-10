import 'dart:developer';
import 'dart:io';

import 'package:sample/core/models/app_response.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';

class RemoteDataProvider {
  RemoteDataProvider() {
    _client = Client(
      Platform.isIOS ? 'http://127.0.0.1:8080/' : 'http://10.0.2.2:8080/',
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Client? _client;

  Future<AppResponse<UserResponse, GatewayError>> signIn(
      SignInRequest model) async {
    try {
      final result = await _client?.user.signIn(model);

      if (result == null) AppResponse.error(GatewayError.somethingWrong);

      return AppResponse.success(data: result);
    } catch (e) {
      return _errorHandler(e);
    }
  }

  Future<AppResponse<void, GatewayError>> signOut(UuidValue? userId) async {
    try {
      await _client?.user.signOut(userId);

      return AppResponse.success();
    } catch (e) {
      return _errorHandler(e);
    }
  }

  Future<AppResponse<void, GatewayError>> changeName(
      ChangeNameRequest model) async {
    try {
      await _client?.user.changeName(model);

      return AppResponse.success();
    } catch (e) {
      return _errorHandler(e);
    }
  }

  AppResponse<T, GatewayError> _errorHandler<T>(Object e) {
    log(e.toString());

    if (e is SocketException) {
      return AppResponse.error(GatewayError.serverUnavailable);
    }

    if (e is ServerpodClientException) {
      return AppResponse.error(GatewayError.somethingWrong);
    }

    return AppResponse.error(GatewayError.somethingWrong);
  }
}
