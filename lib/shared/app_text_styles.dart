import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: 'SourceCodePro',
  );

  static const subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: 'SourceCodePro',
  );

  static const body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
    fontFamily: 'SourceCodePro',
  );
}
