import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/models/theme/colors/app_theme_colors.dart';
import 'package:sample/core/models/theme/models/app_text_theme_model.dart';

/// Модель содержит в себе кастомные цвета, нужны для темы
class AppThemeModel {
  final Color basicColor;
  final Color revertBasicColor;
  final Color cardColor;
  final Color textGrayColor;
  final Color textColor;
  final Color revertTextColor;

  Color alwaysBlackTextColor = AppLightColors.text;
  Color alwaysWhiteTextColor = AppDarkColors.text;
  Color alwaysBlackColor = AppStaticColors.black;
  Color alwaysWhiteColor = AppStaticColors.white;
  Color primaryColor = AppStaticColors.primary;
  Color redColor = AppStaticColors.red;
  Color blueColor = AppStaticColors.blue;
  Color yellowColor = AppStaticColors.yellow;
  Color greenColor = AppStaticColors.green;

  final Brightness brightness;

  final AppTextThemeModel textTheme;

  factory AppThemeModel({
    required Color basicColor,
    required Color revertBasicColor,
    required Color cardColor,
    required Color textGrayColor,
    required Color textColor,
    required Color revertTextColor,
    required Brightness brightness,
    required AppTextThemeModel textTheme,
  }) {
    return AppThemeModel.raw(
      basicColor: basicColor,
      revertBasicColor: revertBasicColor,
      cardColor: cardColor,
      textGrayColor: textGrayColor,
      textColor: textColor,
      revertTextColor: revertTextColor,
      brightness: brightness,
      textTheme: textTheme,
    );
  }

  AppThemeModel.raw({
    required this.basicColor,
    required this.revertBasicColor,
    required this.textGrayColor,
    required this.cardColor,
    required this.textColor,
    required this.revertTextColor,
    required this.brightness,
    required this.textTheme,
  });

  static AppThemeModel lerp(AppThemeModel begin, AppThemeModel end, double t) {
    return AppThemeModel(
      basicColor: Color.lerp(begin.basicColor, end.basicColor, t)!,
      revertBasicColor: Color.lerp(begin.revertBasicColor, end.revertBasicColor, t)!,
      textGrayColor: Color.lerp(begin.textGrayColor, end.textGrayColor, t)!,
      cardColor: Color.lerp(begin.cardColor, end.cardColor, t)!,
      textColor: Color.lerp(begin.textColor, end.textColor, t)!,
      revertTextColor: Color.lerp(begin.revertTextColor, end.revertTextColor, t)!,
      brightness: begin.brightness,
      textTheme: AppTextThemeModel.lerp(begin.textTheme, end.textTheme, t),
    );
  }
}
