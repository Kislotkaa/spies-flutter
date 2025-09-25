import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/cubits/intl_cubit.dart';
import 'package:sample/core/cubits/snackbar_cubit.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/feature/home/presentation/bloc/home_bloc.dart';
import 'package:sample/locator.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bloc
        BlocProvider<HomeBloc>(create: (_) => di.sl<HomeBloc>()),

        // Cubit
        BlocProvider<ThemeCubit>(create: (_) => di.sl<ThemeCubit>()),
        BlocProvider<IntlCubit>(create: (_) => di.sl<IntlCubit>()),
        BlocProvider<SnackBarCubit>(create: (_) => di.sl<SnackBarCubit>()),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, themeState) => di.sl<ThemeCubit>().rebuildAllChildren(context),
        listenWhen: (prev, current) => prev.isDarkMode != current.isDarkMode,
        builder: (context, themeState) => BlocBuilder<IntlCubit, IntlState>(
          builder: (_, intlState) {
            return MaterialApp.router(
              title: 'Sample',
              showPerformanceOverlay: false,
              debugShowMaterialGrid: false,
              showSemanticsDebugger: false,
              checkerboardRasterCacheImages: false,
              checkerboardOffscreenLayers: false,
              debugShowCheckedModeBanner: false,
              theme: di.sl<ThemeCubit>().getLightThemeData(),
              darkTheme: di.sl<ThemeCubit>().getDarkThemeData(),
              themeMode: themeState.themeMode,
              locale: intlState.getLocale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routerConfig: di.sl<AppRouter>().config(),
            );
          },
        ),
      ),
    );
  }
}
