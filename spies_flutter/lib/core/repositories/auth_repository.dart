import 'dart:async';

import 'package:sample/core/models/app_response.dart';
import 'package:sample/core/models/user_model.dart';
import 'package:sample/core/providers/local_data_provider.dart';
import 'package:sample/core/providers/remote_data_provider.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';

class UserRepository {
  final RemoteDataProvider _remoteDataProvider;
  final LocalDataProvider _localDataProvider;

  UserRepository(
    this._remoteDataProvider,
    this._localDataProvider,
  );

  UserModel? user;

  bool get isAuth => user != null;

  bool checkAuth() {
    user = _localDataProvider.getUser();
    return isAuth;
  }

  Future<AppResponse<UserResponse, GatewayError>> signIn(
    SignInRequest model,
  ) async {
    final result = await _remoteDataProvider.signIn(model);

    if (result.isSuccess) {
      user = UserModel(
        name: model.name,
        deviceId: model.deviceId,
      );

      _localDataProvider.saveUser(user);
    }

    return result;
  }

  Future<AppResponse<void, GatewayError>> signOut(
    SignOutRequest model,
  ) async {
    final result = await _remoteDataProvider.signOut(model);

    if (result.isSuccess) {
      user = null;
      _localDataProvider.saveUser(null);
    }

    return result;
  }
}
