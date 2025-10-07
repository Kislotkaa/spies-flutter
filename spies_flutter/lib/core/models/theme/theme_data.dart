import 'package:flutter/material.dart';
import 'package:sample/core/models/theme/colors.dart';
import 'package:sample/core/models/theme/theme_color.dart';
import 'package:sample/core/models/theme/theme_text.dart';

class AppThemeData {
  static final ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: ColorTheme.dark.basicColor,
      iconTheme: IconThemeData(color: ColorTheme.light.basicColor),
      surfaceTintColor: AppStaticColors.black,
    ),
    extensions: [
      ColorTheme.dark,
      ThemeText.dark,
    ],
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppStaticColors.black,
      linearTrackColor: AppStaticColors.black,
      color: AppStaticColors.white,
    ),
    dividerColor: AppDarkColors.card,
    brightness: Brightness.dark,
    unselectedWidgetColor: AppDarkColors.text,
    iconTheme: const IconThemeData(color: AppDarkColors.text),
    shadowColor: AppDarkColors.shadow,
    hintColor: AppDarkColors.textGray,
    disabledColor: AppDarkColors.textGray,
    scaffoldBackgroundColor: AppStaticColors.black,
    inputDecorationTheme: const InputDecorationTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppDarkColors.text),
      bodyLarge: TextStyle(color: AppDarkColors.text),
      bodyMedium: TextStyle(color: AppDarkColors.text),
      headlineSmall: TextStyle(color: AppDarkColors.text),
      headlineMedium: TextStyle(color: AppDarkColors.text),
      displaySmall: TextStyle(color: AppDarkColors.text),
      displayMedium: TextStyle(color: AppDarkColors.text),
      displayLarge: TextStyle(color: AppDarkColors.text),
      titleMedium: TextStyle(color: AppDarkColors.text),
    ),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppStaticColors.white,
      iconTheme: IconThemeData(
        color: AppLightColors.text,
      ),
      surfaceTintColor: AppStaticColors.white,
    ),
    extensions: [
      ColorTheme.light,
      ThemeText.light,
    ],
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppStaticColors.white,
      linearTrackColor: AppStaticColors.white,
      color: AppStaticColors.black,
    ),
    brightness: Brightness.light,
    dividerColor: AppLightColors.card,
    unselectedWidgetColor: AppLightColors.text,
    iconTheme: const IconThemeData(color: AppLightColors.text),
    shadowColor: AppLightColors.shadow,
    scaffoldBackgroundColor: AppStaticColors.white,
    hintColor: AppLightColors.textGray,
    disabledColor: AppLightColors.textGray,
    inputDecorationTheme: const InputDecorationTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppLightColors.text),
      bodyLarge: TextStyle(color: AppLightColors.text),
      bodyMedium: TextStyle(color: AppLightColors.text),
      headlineSmall: TextStyle(color: AppLightColors.text),
      headlineMedium: TextStyle(color: AppLightColors.text),
      displaySmall: TextStyle(color: AppLightColors.text),
      displayMedium: TextStyle(color: AppLightColors.text),
      displayLarge: TextStyle(color: AppLightColors.text),
      titleMedium: TextStyle(color: AppLightColors.text),
    ),
  );
}
