import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/src/repositories/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeCubit(
    this._themeRepository,
  ) : super(const ThemeState()) {
    _listenTheme();
  }

  StreamSubscription<ThemeMode>? _themeSubscription;

  @override
  Future<void> close() {
    _themeSubscription?.cancel();
    _themeRepository.dispose();
    return super.close();
  }

  void _listenTheme() {
    _themeSubscription = _themeRepository.getTheme().listen(
      (customTheme) {
        if (customTheme.name == ThemeMode.light.name) {
          emit(
            const ThemeState(
              themeMode: ThemeMode.light,
              isDarkMode: false,
            ),
          );

          return;
        }

        if (customTheme.name == ThemeMode.dark.name) {
          emit(
            const ThemeState(
              themeMode: ThemeMode.dark,
              isDarkMode: true,
            ),
          );
          return;
        }

        final brightness = PlatformDispatcher.instance.platformBrightness;
        if (brightness == Brightness.dark) {
          emit(
            const ThemeState(
              themeMode: ThemeMode.dark,
              isDarkMode: true,
            ),
          );
          return;
        }

        emit(
          const ThemeState(
            themeMode: ThemeMode.light,
            isDarkMode: false,
          ),
        );
      },
    );
  }

  void switchTheme() {
    if (state.isDarkMode) {
      _themeRepository.saveTheme(ThemeMode.light);
    } else {
      _themeRepository.saveTheme(ThemeMode.dark);
    }
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}

class ThemeState {
  final ThemeMode themeMode;
  final bool isDarkMode;

  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.isDarkMode = false,
  });
}
