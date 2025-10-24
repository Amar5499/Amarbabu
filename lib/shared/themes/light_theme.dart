import 'package:flutter/material.dart';
import '../app_colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'SourceCodePro',
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.lightBackground,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    background: AppColors.lightBackground,
    onBackground: AppColors.lightTextPrimary,
    surface: AppColors.lightBackground,
    onSurface: AppColors.lightTextPrimary,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextSecondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.lightTextPrimary,
    ),
  ),
);
