import 'dart:convert';

import 'package:sample/core/utils/constants.dart';
import 'package:serverpod_flutter_client/serverpod_flutter_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataProvider {
  final SharedPreferences _prefs;

  LocalDataProvider(this._prefs);

  void saveUser(UserResponse? user) {
    if (user == null) {
      _prefs.remove(SPrefsKeys.USER);
      return;
    }

    _prefs.setString(SPrefsKeys.USER, jsonEncode(user.toJson()));
  }

  UserResponse? getUser() {
    final result = _prefs.getString(SPrefsKeys.USER);
    if (result == null) return null;

    return UserResponse.fromJson(jsonDecode(result));
  }

  String? getLocal() => _prefs.getString(SPrefsKeys.INTL);

  void saveLocale(String locale) => _prefs.setString(SPrefsKeys.INTL, locale);

  String? getTheme() => _prefs.getString(SPrefsKeys.THEME);

  void saveTheme(String themeName) => _prefs.setString(SPrefsKeys.THEME, themeName);
}
