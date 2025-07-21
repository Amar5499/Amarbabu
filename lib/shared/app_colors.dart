import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFFFBE98);
  static const secondary = Color(0xFFB88AC4);
  static const background = Color(0xFFFFF8F2);
  static const textPrimary = Color(0xFF3B3B3B);
  static const textSecondary = Color(0xFF7A7A7A);
  static const white = Color(0xFFFFFFFF);

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFE7D6),
      Color(0xFFFFFFFF),
    ],
  );
}
