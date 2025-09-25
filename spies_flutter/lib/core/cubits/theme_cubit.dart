import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/repositories/theme_repository.dart';
import 'package:sample/core/models/theme/app_theme.dart';
import 'package:sample/core/models/theme/app_theme_data.dart';
import 'package:sample/core/models/theme/models/app_theme_model.dart';
import 'package:sample/locator.dart';

bool get isDarkMode => sl<ThemeCubit>().state.isDarkMode;

AppThemeModel get appTheme => sl<ThemeCubit>().state.appTheme ?? sl<ThemeCubit>()._getAppTheme();

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeCubit(
    this._themeRepository,
  ) : super(const ThemeState()) {
    _listenTheme();

    emit(
      ThemeState(
        appTheme: _getAppTheme(),
      ),
    );
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
            ThemeState(
              themeMode: ThemeMode.light,
              isDarkMode: false,
              appTheme: AppTheme.light,
            ),
          );

          return;
        }

        if (customTheme.name == ThemeMode.dark.name) {
          emit(
            ThemeState(
              themeMode: ThemeMode.dark,
              isDarkMode: true,
              appTheme: AppTheme.dark,
            ),
          );
          return;
        }

        final brightness = PlatformDispatcher.instance.platformBrightness;
        if (brightness == Brightness.dark) {
          emit(
            ThemeState(
              themeMode: ThemeMode.dark,
              isDarkMode: true,
              appTheme: AppTheme.dark,
            ),
          );
          return;
        }

        emit(
          ThemeState(
            themeMode: ThemeMode.light,
            isDarkMode: false,
            appTheme: AppTheme.light,
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

  ThemeData getLightThemeData() => AppThemeData.light;

  ThemeData getDarkThemeData() => AppThemeData.dark;

  AppThemeModel _getAppTheme() => state.isDarkMode ? AppTheme.dark : AppTheme.light;
}

class ThemeState {
  final ThemeMode themeMode;
  final bool isDarkMode;
  final AppThemeModel? appTheme;

  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.isDarkMode = false,
    this.appTheme,
  });
}
