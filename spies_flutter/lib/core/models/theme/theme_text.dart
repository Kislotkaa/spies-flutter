import 'package:flutter/material.dart';
import 'package:sample/core/gen/fonts.gen.dart';
import 'package:sample/core/models/theme/theme_color.dart';

class ThemeText extends ThemeExtension<ThemeText> {
  final TextStyle semi20;
  final TextStyle extra20;
  final TextStyle semi18;
  final TextStyle semi16;
  final TextStyle semi14;
  final TextStyle extra14;
  final TextStyle semi12;

  const ThemeText({
    required this.semi20,
    required this.extra20,
    required this.semi18,
    required this.semi16,
    required this.semi14,
    required this.extra14,
    required this.semi12,
  });

  static ThemeText _getTextTheme(Color? color) => ThemeText(
        semi20: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 20,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        extra20: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 20,
          height: 1.2,
          fontWeight: FontWeight.w800,
          color: color,
        ),
        semi18: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 18,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        semi16: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 16,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        semi14: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 14,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        extra14: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 14,
          height: 1.2,
          fontWeight: FontWeight.w800,
          color: color,
        ),
        semi12: TextStyle(
          fontFamily: FontFamily.shantellSans,
          fontSize: 12,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );

  static get light => _getTextTheme(ColorTheme.light.textColor);

  static get dark => _getTextTheme(ColorTheme.dark.textColor);

  @override
  ThemeExtension<ThemeText> lerp(ThemeExtension<ThemeText>? other, double t) {
    if (other is! ThemeText) {
      return this;
    }

    return ThemeText(
      semi20: other.semi20.copyWith(color: Color.lerp(semi20.color, other.semi20.color, t)),
      extra20: other.semi20.copyWith(color: Color.lerp(extra20.color, other.extra20.color, t)),
      semi18: other.semi20.copyWith(color: Color.lerp(semi18.color, other.semi18.color, t)),
      semi16: other.semi20.copyWith(color: Color.lerp(semi16.color, other.semi16.color, t)),
      semi14: other.semi20.copyWith(color: Color.lerp(semi14.color, other.semi14.color, t)),
      extra14: other.semi20.copyWith(color: Color.lerp(extra14.color, other.extra14.color, t)),
      semi12: other.semi20.copyWith(color: Color.lerp(semi12.color, other.semi12.color, t)),
    );
  }

  @override
  ThemeExtension<ThemeText> copyWith() => this;
}
