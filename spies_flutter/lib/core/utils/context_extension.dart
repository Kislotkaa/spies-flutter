import 'package:flutter/material.dart';
import 'package:sample/core/models/theme/app_color_theme.dart';
import 'package:sample/core/models/theme/app_text_theme.dart';

extension ContextExtension on BuildContext {
  AppTextTheme get textTheme => Theme.of(this).extension<AppTextTheme>()!;
  AppColorTheme get colorTheme => Theme.of(this).extension<AppColorTheme>()!;
}
