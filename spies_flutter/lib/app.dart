import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample/core/models/theme/theme_data.dart';
import 'package:sample/src/cubits/intl_cubit.dart';
import 'package:sample/src/cubits/theme_cubit.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, themeState) => context.read<ThemeCubit>().rebuildAllChildren(context),
      listenWhen: (prev, current) => prev.isDarkMode != current.isDarkMode,
      builder: (context, themeState) => BlocBuilder<IntlCubit, IntlState>(
        builder: (_, intlState) => MaterialApp.router(
          title: 'Sample',
          showPerformanceOverlay: false,
          debugShowMaterialGrid: false,
          showSemanticsDebugger: false,
          checkerboardRasterCacheImages: false,
          checkerboardOffscreenLayers: false,
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.light,
          darkTheme: AppThemeData.dark,
          themeMode: themeState.themeMode,
          locale: intlState.getLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerConfig: router.config(),
        ),
      ),
    );
  }
}
