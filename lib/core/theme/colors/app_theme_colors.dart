import 'package:flutter/material.dart';

export 'app_static_colors.dart';

// Этот файлы содержит классы цветов которые меняются при смены темы AppDarkColors.text -> AppLightColors.text
class AppDarkColors {
  // ЦВЕТА
  static const Color text = Color.fromRGBO(255, 255, 255, 1);
  static const Color textGray = Color.fromRGBO(113, 113, 113, 1);
  static const Color card = Color.fromRGBO(75, 75, 75, 1);
  static const Color basic = Color.fromRGBO(0, 0, 0, 1);
  static const Color shadow = Color.fromRGBO(255, 255, 255, 0.25);
}

/// Этот класс содержит в себе цвета для светлой темы
class AppLightColors {
  // ЦВЕТА
  static const Color text = Color.fromRGBO(47, 47, 47, 1);
  static const Color textGray = Color.fromRGBO(198, 198, 198, 1);
  static const Color card = Color.fromRGBO(238, 238, 238, 1);
  static const Color basic = Color.fromRGBO(255, 255, 255, 1);
  static const Color shadow = Color.fromRGBO(0, 0, 0, 0.25);
}
