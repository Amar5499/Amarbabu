import 'package:flutter/material.dart';

class AppColors {
  // --------------------
  // Core Colors
  // --------------------
  static const Color primary = Color(0xFF4A90E2); // Elegant deep blue
  static const Color secondary = Color(0xFF7ED6DF); // Soft mint
  static const Color white = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFE26D5C);
  static const Color onError = white;

  // --------------------
  // Light Theme Colors
  // --------------------
  static const Color lightBackground = Color(0xFFFFFCF7); // Bright warm white
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF2C2C2C); // Deep neutral gray
  static const Color lightTextSecondary = Color(0xFF696969); // Muted gray

  // --------------------
  // Dark Theme Colors
  // --------------------
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF2A2A2A);
  static const Color darkTextPrimary = Color(0xFFEDEDED);
  static const Color darkTextSecondary = Color(0xFFCFCFCF);
  static const Color darkError = Color(0xFFFF8A80);
  static const Color darkOnError = Colors.black;

  // --------------------
  // Gradients
  // --------------------
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE4F9F5), // Pale mint blue
      Color(0xFFD6E6F2), // Soft light blue
    ],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primary,
      secondary,
    ],
  );
}
