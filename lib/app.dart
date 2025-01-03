import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spies/core/gen/l10n/generated/l10n.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/feature/game/presentation/bloc/on_client/on_client_cubit.dart';
import 'package:spies/feature/game/presentation/bloc/on_server/on_server_cubit.dart';
import 'package:spies/feature/home/presentation/bloc/home_bloc.dart';
import 'package:spies/locator.dart' as di;


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bloc
        BlocProvider<HomeBloc>(create: (BuildContext context) => di.sl<HomeBloc>()),
        BlocProvider<GameBloc>(create: (BuildContext context) => di.sl<GameBloc>()),

        // Cubit
        BlocProvider<ThemeCubit>(create: (context) => di.sl<ThemeCubit>()),
        BlocProvider<OnClientCubit>(create: (context) => di.sl<OnClientCubit>()),
        BlocProvider<OnServerCubit>(create: (context) => di.sl<OnServerCubit>()),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) => di.sl<ThemeCubit>().rebuildAllChildren(context),
        listenWhen: (prev, current) => prev.isDarkMode != current.isDarkMode,
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Spies',
            showPerformanceOverlay: false,
            debugShowMaterialGrid: false,
            showSemanticsDebugger: false,
            checkerboardRasterCacheImages: false,
            checkerboardOffscreenLayers: false,
            debugShowCheckedModeBanner: false,
            theme: di.sl<ThemeCubit>().getLightThemeData(),
            darkTheme: di.sl<ThemeCubit>().getDarkThemeData(),
            themeMode: themeState.themeMode,
            locale: Locale(Platform.localeName),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            routerConfig: di.sl<AppRouter>().config(),
          );
        },
      ),
    );
  }
}
