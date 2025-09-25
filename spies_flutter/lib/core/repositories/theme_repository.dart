import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample/core/providers/local_data_provider.dart';

class ThemeRepository {
  final LocalDataProvider _localDataProvider;

  ThemeRepository(this._localDataProvider) {
    _init();
  }

  final _controller = StreamController<ThemeMode>();

  void _init() {
    try {
      final theme = _localDataProvider.getTheme();

      if (theme == ThemeMode.light.name) {
        _controller.add(ThemeMode.light);
        return;
      }

      if (theme == ThemeMode.dark.name) {
        _controller.add(ThemeMode.dark);
        return;
      }

      _controller.add(ThemeMode.system);
    } catch (_) {
      saveTheme(ThemeMode.system);
    }
  }

  Stream<ThemeMode> getTheme() async* {
    yield* _controller.stream;
  }

  Future<void> saveTheme(ThemeMode theme) async {
    _controller.add(theme);
    _localDataProvider.saveTheme(theme.name);
  }

  void dispose() => _controller.close();
}
