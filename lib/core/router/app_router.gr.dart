// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:spies/feature/game/presentation/pages/game_page.dart' as _i2;
import 'package:spies/feature/game/presentation/pages/suggest_word_page.dart'
    as _i6;
import 'package:spies/feature/home/presentation/pages/home_page.dart' as _i3;
import 'package:spies/feature/home/presentation/pages/where_is_connect_page.dart'
    as _i7;
import 'package:spies/feature/settings/presentation/pages/about_page.dart'
    as _i1;
import 'package:spies/feature/settings/presentation/pages/how_page.dart' as _i4;
import 'package:spies/feature/settings/presentation/pages/settings_page.dart'
    as _i5;

/// generated route for
/// [_i1.AboutPage]
class AboutRoute extends _i8.PageRouteInfo<void> {
  const AboutRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutPage();
    },
  );
}

/// generated route for
/// [_i2.GamePage]
class GameRoute extends _i8.PageRouteInfo<void> {
  const GameRoute({List<_i8.PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.GamePage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.HowPage]
class HowRoute extends _i8.PageRouteInfo<void> {
  const HowRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HowRoute.name,
          initialChildren: children,
        );

  static const String name = 'HowRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HowPage();
    },
  );
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsPage();
    },
  );
}

/// generated route for
/// [_i6.SuggestWordPage]
class SuggestWordRoute extends _i8.PageRouteInfo<void> {
  const SuggestWordRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SuggestWordRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuggestWordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SuggestWordPage();
    },
  );
}

/// generated route for
/// [_i7.WhereIsConnectPage]
class WhereIsConnectRoute extends _i8.PageRouteInfo<WhereIsConnectRouteArgs> {
  WhereIsConnectRoute({
    _i9.Key? key,
    String? ipInitial,
    String? nameInitial,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          WhereIsConnectRoute.name,
          args: WhereIsConnectRouteArgs(
            key: key,
            ipInitial: ipInitial,
            nameInitial: nameInitial,
          ),
          initialChildren: children,
        );

  static const String name = 'WhereIsConnectRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WhereIsConnectRouteArgs>(
          orElse: () => const WhereIsConnectRouteArgs());
      return _i7.WhereIsConnectPage(
        key: args.key,
        ipInitial: args.ipInitial,
        nameInitial: args.nameInitial,
      );
    },
  );
}

class WhereIsConnectRouteArgs {
  const WhereIsConnectRouteArgs({
    this.key,
    this.ipInitial,
    this.nameInitial,
  });

  final _i9.Key? key;

  final String? ipInitial;

  final String? nameInitial;

  @override
  String toString() {
    return 'WhereIsConnectRouteArgs{key: $key, ipInitial: $ipInitial, nameInitial: $nameInitial}';
  }
}
