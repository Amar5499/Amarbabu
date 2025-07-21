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
    onBackground: AppColors.darkOnBackground,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkOnBackground,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.darkOnSurface,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.darkOnBackground,
    ),
  ),
);
