// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i12;
import 'package:sample/core/models/dialog_model.dart' as _i11;
import 'package:sample/presentation/auth/pages/auth_page.dart' as _i2;
import 'package:sample/presentation/create_game/pages/create_game_page.dart'
    as _i3;
import 'package:sample/presentation/game/pages/game_page.dart' as _i4;
import 'package:sample/presentation/main/pages/main_page.dart' as _i6;
import 'package:sample/presentation/settings/pages/game_rules_page.dart' as _i5;
import 'package:sample/presentation/settings/pages/settings_page.dart' as _i7;
import 'package:sample/presentation/splash/pages/splash_page.dart' as _i8;
import 'package:sample/presentation/suggest_word/pages/suggest_word_page.dart'
    as _i9;
import 'package:sample/src/widgets/app_dialog_page.dart' as _i1;

/// generated route for
/// [_i1.AppDialogPage]
class AppDialogRoute extends _i10.PageRouteInfo<AppDialogRouteArgs> {
  AppDialogRoute({
    required _i11.DialogModel model,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AppDialogRoute.name,
          args: AppDialogRouteArgs(
            model: model,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AppDialogRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppDialogRouteArgs>();
      return _i1.AppDialogPage(
        args.model,
        key: args.key,
      );
    },
  );
}

class AppDialogRouteArgs {
  const AppDialogRouteArgs({
    required this.model,
    this.key,
  });

  final _i11.DialogModel model;

  final _i12.Key? key;

  @override
  String toString() {
    return 'AppDialogRouteArgs{model: $model, key: $key}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthPage();
    },
  );
}

/// generated route for
/// [_i3.CreateGamePage]
class CreateGameRoute extends _i10.PageRouteInfo<void> {
  const CreateGameRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CreateGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateGameRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateGamePage();
    },
  );
}

/// generated route for
/// [_i4.GamePage]
class GameRoute extends _i10.PageRouteInfo<void> {
  const GameRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.GamePage();
    },
  );
}

/// generated route for
/// [_i5.GameRulesPage]
class GameRulesRoute extends _i10.PageRouteInfo<void> {
  const GameRulesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GameRulesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRulesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.GameRulesPage();
    },
  );
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainPage();
    },
  );
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsPage();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}

/// generated route for
/// [_i9.SuggestWordPage]
class SuggestWordRoute extends _i10.PageRouteInfo<void> {
  const SuggestWordRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SuggestWordRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuggestWordRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SuggestWordPage();
    },
  );
}
