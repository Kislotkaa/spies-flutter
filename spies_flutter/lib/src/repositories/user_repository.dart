import 'dart:async';

import 'package:sample/core/models/app_response.dart';
import 'package:sample/core/models/user_model.dart';
import 'package:sample/src/providers/local_data_provider.dart';
import 'package:sample/src/providers/remote_data_provider.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';

class UserRepository {
  final RemoteDataProvider _remoteDataProvider;
  final LocalDataProvider _localDataProvider;

  UserRepository(
    this._remoteDataProvider,
    this._localDataProvider,
  );

  UserModel? _user;

  bool get isAuth => user != null;
  UserModel? get user {
    _user ??= _localDataProvider.getUser();
    return _user;
  }

  Future<AppResponse<UserResponse, GatewayError>> signIn(SignInRequest model) async {
    final result = await _remoteDataProvider.signIn(model);

    if (result.isSuccess) {
      _user = UserModel(
        name: model.name,
        deviceId: model.deviceId,
      );

      _localDataProvider.saveUser(_user);
    }

    return result;
  }

  Future<AppResponse<void, GatewayError>> signOut(SignOutRequest model) async {
    final result = await _remoteDataProvider.signOut(model);

    if (result.isSuccess) {
      _user = null;
      _localDataProvider.saveUser(null);
    }

    return result;
  }
}
