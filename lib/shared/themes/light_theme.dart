import 'package:flutter/material.dart';
import '../app_colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'SourceCodePro',
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    background: AppColors.background,
    onBackground: AppColors.textPrimary,
    surface: AppColors.background,
    onSurface: AppColors.textPrimary,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.textPrimary,
    ),
  ),
);
