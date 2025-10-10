import 'dart:async';

import 'package:sample/core/models/app_response.dart';

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

  UserResponse? _user;

  UuidValue? get userId => _user?.id;
  String? get name => _user?.name;

  bool get isAuth => user != null;
  UserResponse? get user {
    _user ??= _localDataProvider.getUser();
    return _user;
  }

  Future<AppResponse<UserResponse, GatewayError>> signIn(
      SignInRequest model) async {
    final result = await _remoteDataProvider.signIn(model);

    if (result.isSuccess) {
      _user = result.data;
      _localDataProvider.saveUser(result.data);
    }

    return result;
  }

  Future<AppResponse<void, GatewayError>> signOut() async {
    final result = await _remoteDataProvider.signOut(_user?.id);

    if (result.isSuccess) {
      _user = null;
      _localDataProvider.saveUser(null);
    }

    return result;
  }

  Future<AppResponse<void, GatewayError>> changeName(
      ChangeNameRequest model) async {
    final result = await _remoteDataProvider.changeName(model);

    if (result.isSuccess) {
      _user?.name = model.newName;
      _localDataProvider.saveUser(_user);
    }

    return result;
  }
}
