import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import '../resources/resources.dart';

class AppThemes {
  static AppThemes? _instance;

  AppThemes._();

  factory AppThemes() {
    _instance ??= AppThemes._();
    return _instance!;
  }

  ThemeData get lightTheme => _lightTheme;

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0, height: 1.5, color: AppColors.black),
    displayMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0, height: 1.5, color: AppColors.black),
    displaySmall: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0, height: 1.5, color: AppColors.black),
    headlineLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0, height: 1.5, color: AppColors.black),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0, height: 1.5, color: AppColors.black),
    headlineSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0, height: 1.5, color: AppColors.black),
    titleLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0, height: 1.5, color: AppColors.black),
    titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0, height: 1.5, color: AppColors.black),
    titleSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, height: 1.5, color: AppColors.black),
    bodyLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0, height: 1.5, color: AppColors.black),
    bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, height: 1.5, color: AppColors.black),
    bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, height: 1.5, color: AppColors.black),
    labelLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, height: 1.5, color: AppColors.black),
    labelMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0, height: 1.5, color: AppColors.black),
    labelSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.0, height: 1.5, color: AppColors.black),
  );

  final _lightTheme = ThemeData(
    fontFamily: FontFamily.poppins,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: _lightTextTheme,
    scaffoldBackgroundColor: AppColors.white,
  );
}
