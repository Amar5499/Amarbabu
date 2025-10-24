import 'package:flutter/material.dart';
import '../app_colors.dart';

final darkTheme = ThemeData(
  fontFamily: 'SourceCodePro',
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.darkBackground,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.darkBackground,
    secondary: AppColors.secondary,
    onSecondary: AppColors.darkBackground,
    error: AppColors.darkError,
    onError: AppColors.darkOnError,
    background: AppColors.darkBackground,
    onBackground: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkSurface,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextSecondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.darkTextPrimary,
    ),
  ),
);
