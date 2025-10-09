import 'package:flutter/material.dart';
import 'package:sample/core/models/theme/colors.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color basicColor;
  final Color revertBasicColor;
  final Color cardColor;
  final Color textGrayColor;
  final Color textColor;
  final Color revertTextColor;

  Color get alwaysBlackTextColor => AppLightColors.text;
  Color get alwaysWhiteTextColor => AppDarkColors.text;
  Color get alwaysBlackColor => AppStaticColors.black;
  Color get alwaysWhiteColor => AppStaticColors.white;
  Color get primaryColor => AppStaticColors.primary;
  Color get redColor => AppStaticColors.red;
  Color get blueColor => AppStaticColors.blue;
  Color get yellowColor => AppStaticColors.yellow;
  Color get greenColor => AppStaticColors.green;

  static const light = AppColorTheme(
    basicColor: AppLightColors.basic,
    revertBasicColor: AppDarkColors.basic,
    textGrayColor: AppLightColors.textGray,
    textColor: AppLightColors.text,
    revertTextColor: AppDarkColors.text,
    cardColor: AppLightColors.card,
  );

  static const dark = AppColorTheme(
    basicColor: AppDarkColors.basic,
    revertBasicColor: AppLightColors.basic,
    textGrayColor: AppDarkColors.textGray,
    textColor: AppDarkColors.text,
    revertTextColor: AppLightColors.text,
    cardColor: AppDarkColors.card,
  );

  const AppColorTheme({
    required this.basicColor,
    required this.revertBasicColor,
    required this.textGrayColor,
    required this.textColor,
    required this.revertTextColor,
    required this.cardColor,
  });

  @override
  ThemeExtension<AppColorTheme> lerp(
    ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme?) {
      return this;
    }

    return AppColorTheme(
      basicColor: Color.lerp(basicColor, other?.basicColor, t)!,
      revertBasicColor:
          Color.lerp(revertBasicColor, other?.revertBasicColor, t)!,
      textGrayColor: Color.lerp(textGrayColor, other?.textGrayColor, t)!,
      textColor: Color.lerp(textColor, other?.textColor, t)!,
      revertTextColor: Color.lerp(revertTextColor, other?.revertTextColor, t)!,
      cardColor: Color.lerp(cardColor, other?.cardColor, t)!,
    );
  }

  @override
  ThemeExtension<AppColorTheme> copyWith() => this;
}
