import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spies/core/constants/sprefs_keys.dart';
import 'package:spies/core/utils/abstract_repository.dart';

abstract class UserRepository implements Repository {
  String? getUserName();
  Future setUserName(String name);

  String? getLastIp();
  Future setLastIp(String ip);
}

class UserRepositoryImpl implements UserRepository {
  final SharedPreferences _prefs;

  UserRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  @override
  String? getUserName() => _prefs.getString(SPrefsKeys.USER_NAME);

  @override
  Future<void> setUserName(String name) async => await _prefs.setString(SPrefsKeys.USER_NAME, name);

  @override
  String? getLastIp() => _prefs.getString(SPrefsKeys.LAST_IP);

  @override
  Future<void> setLastIp(String name) async => await _prefs.setString(SPrefsKeys.LAST_IP, name);

  @override
  void dispose() {}
}
