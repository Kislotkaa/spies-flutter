import 'package:flutter/material.dart';
import 'package:sample/core/models/theme/theme_color.dart';
import 'package:sample/core/models/theme/theme_text.dart';

extension ContextExtension on BuildContext {
  ThemeText get textTheme => Theme.of(this).extension<ThemeText>()!;

  ColorTheme get colorTheme => Theme.of(this).extension<ColorTheme>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
