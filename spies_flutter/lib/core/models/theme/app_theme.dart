import 'package:flutter/material.dart';
import 'package:sample/core/gen/fonts.gen.dart';
import 'package:sample/core/models/theme/colors/app_theme_colors.dart';
import 'package:sample/core/models/theme/models/app_text_theme_model.dart';
import 'package:sample/core/models/theme/models/app_theme_model.dart';

class AppTheme {
  static const _fontFamily = FontFamily.shantellSans;
  static final AppThemeModel light = AppThemeModel(
    basicColor: AppLightColors.basic,
    revertBasicColor: AppDarkColors.basic,
    textGrayColor: AppLightColors.textGray,
    textColor: AppLightColors.text,
    revertTextColor: AppDarkColors.text,
    cardColor: AppLightColors.card,
    brightness: Brightness.light,
    textTheme: const AppTextThemeModel(
      bodySemibold20: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppLightColors.text,
      ),
      bodyExtrabold20: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppLightColors.text,
      ),
      bodySemibold18: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppLightColors.text,
      ),
      bodyExtrabold18: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppLightColors.text,
      ),
      bodySemibold16: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppLightColors.text,
      ),
      bodyExtrabold16: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppLightColors.text,
      ),
      bodySemibold14: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppLightColors.text,
      ),
      bodyExtrabold14: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppLightColors.text,
      ),
      bodySemibold12: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppLightColors.text,
      ),
      bodyExtrabold12: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppLightColors.text,
      ),
      bodySemibold10: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppLightColors.text,
      ),
    ),
  );

  static final AppThemeModel dark = AppThemeModel(
    basicColor: AppDarkColors.basic,
    revertBasicColor: AppLightColors.basic,
    textGrayColor: AppDarkColors.textGray,
    textColor: AppDarkColors.text,
    revertTextColor: AppLightColors.text,
    cardColor: AppDarkColors.card,
    brightness: Brightness.dark,
    textTheme: const AppTextThemeModel(
      bodySemibold20: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.text,
      ),
      bodyExtrabold20: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.text,
      ),
      bodySemibold18: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.text,
      ),
      bodyExtrabold18: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.text,
      ),
      bodySemibold16: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.text,
      ),
      bodyExtrabold16: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.text,
      ),
      bodySemibold14: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.text,
      ),
      bodyExtrabold14: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.text,
      ),
      bodySemibold12: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.text,
      ),
      bodyExtrabold12: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.text,
      ),
      bodySemibold10: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.text,
      ),
    ),
  );
}
