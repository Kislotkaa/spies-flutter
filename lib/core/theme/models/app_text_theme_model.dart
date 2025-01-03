import 'package:flutter/painting.dart';

/// Модель содержит в себе кастомные шрифты, нужны для темы
/// --------------------
/// НАПРЯМУЮ ОТ СЮДА НЕ БРАТЬ, ПРОКИДЫВАТЬ ЧЕРЕЗ AppThemeFarfor и AppThemeModel
class AppTextThemeModel {
  final TextStyle bodySemibold20;
  final TextStyle bodyExtrabold20;
  final TextStyle bodySemibold18;
  final TextStyle bodyExtrabold18;
  final TextStyle bodySemibold16;
  final TextStyle bodyExtrabold16;
  final TextStyle bodySemibold14;
  final TextStyle bodyExtrabold14;
  final TextStyle bodySemibold12;
  final TextStyle bodyExtrabold12;
  final TextStyle bodySemibold10;

  const AppTextThemeModel({
    required this.bodySemibold20,
    required this.bodyExtrabold20,
    required this.bodySemibold18,
    required this.bodyExtrabold18,
    required this.bodySemibold16,
    required this.bodyExtrabold16,
    required this.bodySemibold14,
    required this.bodyExtrabold14,
    required this.bodySemibold12,
    required this.bodyExtrabold12,
    required this.bodySemibold10,
  });

  AppTextThemeModel copyWith({
    required TextStyle bodySemibold20,
    required TextStyle bodyExtrabold20,
    required TextStyle bodySemibold18,
    required TextStyle bodyExtrabold18,
    required TextStyle bodySemibold16,
    required TextStyle bodyExtrabold16,
    required TextStyle bodySemibold14,
    required TextStyle bodyExtrabold14,
    required TextStyle bodySemibold12,
    required TextStyle bodyExtrabold12,
    required TextStyle bodySemibold10,
  }) {
    return AppTextThemeModel(
      bodySemibold20: bodySemibold20,
      bodyExtrabold20: bodyExtrabold20,
      bodySemibold18: bodySemibold18,
      bodyExtrabold18: bodyExtrabold18,
      bodySemibold16: bodySemibold16,
      bodyExtrabold16: bodyExtrabold16,
      bodySemibold14: bodySemibold14,
      bodyExtrabold14: bodyExtrabold14,
      bodySemibold12: bodySemibold12,
      bodyExtrabold12: bodyExtrabold12,
      bodySemibold10: bodySemibold10,
    );
  }

  static AppTextThemeModel lerp(AppTextThemeModel begin, AppTextThemeModel end, double t) => AppTextThemeModel(
        bodySemibold20: begin.bodySemibold20.copyWith(
          color: Color.lerp(begin.bodySemibold20.color, end.bodySemibold20.color, t),
        ),
        bodyExtrabold20: begin.bodyExtrabold20.copyWith(
          color: Color.lerp(begin.bodyExtrabold20.color, end.bodyExtrabold20.color, t),
        ),
        bodySemibold18: begin.bodySemibold18.copyWith(
          color: Color.lerp(begin.bodySemibold18.color, end.bodySemibold18.color, t),
        ),
        bodyExtrabold18: begin.bodyExtrabold18.copyWith(
          color: Color.lerp(begin.bodyExtrabold18.color, end.bodyExtrabold18.color, t),
        ),
        bodySemibold16: begin.bodySemibold16.copyWith(
          color: Color.lerp(begin.bodySemibold16.color, end.bodySemibold16.color, t),
        ),
        bodyExtrabold16: begin.bodyExtrabold16.copyWith(
          color: Color.lerp(begin.bodyExtrabold16.color, end.bodyExtrabold16.color, t),
        ),
        bodySemibold14: begin.bodySemibold14.copyWith(
          color: Color.lerp(begin.bodySemibold14.color, end.bodySemibold14.color, t),
        ),
        bodyExtrabold14: begin.bodyExtrabold14.copyWith(
          color: Color.lerp(begin.bodyExtrabold14.color, end.bodyExtrabold14.color, t),
        ),
        bodySemibold12: begin.bodySemibold12.copyWith(
          color: Color.lerp(begin.bodySemibold12.color, end.bodySemibold12.color, t),
        ),
        bodyExtrabold12: begin.bodyExtrabold12.copyWith(
          color: Color.lerp(begin.bodyExtrabold12.color, end.bodyExtrabold12.color, t),
        ),
        bodySemibold10: begin.bodySemibold10.copyWith(
          color: Color.lerp(begin.bodySemibold10.color, end.bodySemibold10.color, t),
        ),
      );
}
