import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spies/core/constants/sprefs_keys.dart';
import 'package:spies/core/utils/abstract_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeRepository implements Repository {
  Stream<ThemeMode> getTheme();
  Future saveTheme(ThemeMode theme);
}

class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences _prefs;

  ThemeRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences {
    _init();
  }

  final _controller = StreamController<ThemeMode>();

  void _init() {
    try {
      final themeString = _prefs.getString(SPrefsKeys.THEME_KEY);

      if (themeString == ThemeMode.light.name) {
        _controller.add(ThemeMode.light);
        return;
      }

      if (themeString == ThemeMode.dark.name) {
        _controller.add(ThemeMode.dark);
        return;
      }

      _controller.add(ThemeMode.system);
    } catch (_) {
      saveTheme(ThemeMode.system);
    }
  }

  void _setValue(String themeName) => _prefs.setString(SPrefsKeys.THEME_KEY, themeName);

  // async* и yield* - то же самое, что и async await, только для стрима
  @override
  Stream<ThemeMode> getTheme() async* {
    yield* _controller.stream;
  }

  @override
  Future<void> saveTheme(ThemeMode theme) async {
    _controller.add(theme);
    _setValue(theme.name);
  }

  @override
  void dispose() => _controller.close();
}
