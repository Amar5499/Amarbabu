import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1A73E8);
  static const secondary = Color(0xFF34A853);
  static const background = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF202124);
  static const textSecondary = Color(0xFF5F6368);
  static const white = Color(0xFFFFFFFF);

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE3F2FD),
      Color(0xFFFFFFFF),
    ],
  );
}
