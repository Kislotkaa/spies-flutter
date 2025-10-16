import 'package:flutter/material.dart';
import 'package:sample/core/models/theme/app_color_theme.dart';
import 'package:sample/core/models/theme/app_text_theme.dart';
import 'package:sample/core/models/theme/colors.dart';

class AppThemeData {
  static final ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorTheme.dark.basicColor,
      iconTheme: IconThemeData(color: AppColorTheme.light.basicColor),
      surfaceTintColor: AppStaticColors.black,
    ),
    extensions: [
      AppColorTheme.dark,
      AppTextTheme.dark,
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
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: AppStaticColors.black,
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
      AppColorTheme.light,
      AppTextTheme.light,
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
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );
}
