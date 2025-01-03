import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spies/core/theme/colors/app_theme_colors.dart';
import 'package:spies/core/theme/models/app_text_theme_model.dart';

/// Модель содержит в себе кастомные цвета, нужны для темы
class AppThemeModel {
  // Изменяемые цвета
  final Color basicColor;
  final Color revertBasicColor;

  final Color cardColor;
  final Color textGrayColor;
  final Color textColor;
  final Color revertTextColor;

  // Неизменяемые цвета
  final Color alwaysBlackTextColor = AppLightColors.text;
  final Color alwaysWhiteTextColor = AppDarkColors.text;
  final Color alwaysBlackColor = AppStaticColors.black;
  final Color alwaysWhiteColor = AppStaticColors.white;
  final Color primaryColor = AppStaticColors.primary;
  final Color redColor = AppStaticColors.red;
  final Color yellowColor = AppStaticColors.yellow;
  final Color greenColor = AppStaticColors.green;

  // СИСТЕМНЫЕ
  final Brightness brightness;

  // ТЕКСТ
  final AppTextThemeModel textTheme;

  factory AppThemeModel({
    // Изменяемые цвета
    required Color basicColor,
    required Color revertBasicColor,
    required Color cardColor,
    required Color textGrayColor,
    required Color textColor,
    required Color revertTextColor,

    // СИСТЕМНЫЕ
    required Brightness brightness,

    // ТЕКСТ
    required AppTextThemeModel textTheme,
  }) {
    return AppThemeModel.raw(
      // Изменяемые цвета
      basicColor: basicColor,
      revertBasicColor: revertBasicColor,
      cardColor: cardColor,
      textGrayColor: textGrayColor,
      textColor: textColor,
      revertTextColor: revertTextColor,

      // СИСТЕМНЫЕ
      brightness: brightness,

      // ТЕКСТ
      textTheme: textTheme,
    );
  }

  const AppThemeModel.raw({
    // Изменяемые цвета
    required this.basicColor,
    required this.revertBasicColor,
    required this.textGrayColor,
    required this.cardColor,
    required this.textColor,
    required this.revertTextColor,

    // СИСТЕМНЫЕ
    required this.brightness,

    // ТЕКСТ
    required this.textTheme,
  });

  static AppThemeModel lerp(AppThemeModel begin, AppThemeModel end, double t) {
    return AppThemeModel(
      // Изменяемые цвета
      basicColor: Color.lerp(begin.basicColor, end.basicColor, t)!,
      revertBasicColor: Color.lerp(begin.revertBasicColor, end.revertBasicColor, t)!,

      textGrayColor: Color.lerp(begin.textGrayColor, end.textGrayColor, t)!,

      cardColor: Color.lerp(begin.cardColor, end.cardColor, t)!,
      textColor: Color.lerp(begin.textColor, end.textColor, t)!,
      revertTextColor: Color.lerp(begin.revertTextColor, end.revertTextColor, t)!,

      // СИСТЕМНЫЕ
      brightness: begin.brightness,

      // ТЕКСТ
      textTheme: AppTextThemeModel.lerp(begin.textTheme, end.textTheme, t),
    );
  }
}
