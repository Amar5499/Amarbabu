import 'package:flutter/material.dart';

class AppColors {
  // --------------------
  // Core Colors
  // --------------------
  static const Color primary = Color(0xFF676F9D); // #676f9d (Twilight Zone)
  static const Color secondary = Color(0xFFF9B17A); // #f9b17a (Sun Orange)
  static const Color white = Color(0xFFFFFFFF); // #ffffff
  static const Color error = Color(0xFFE26D5C);
  static const Color onError = white;

  // --------------------
  // Light Theme Colors
  // --------------------
  static const Color lightBackground = white; // #ffffff
  static const Color lightSurface = Color(0xFF424769); // #424769 (Dark Blue)
  static const Color lightTextPrimary =
      Color(0xFF2D3250); // #2d3250 (Midnight Blue)
  static const Color lightTextSecondary =
      Color(0xFF676F9D); // #676f9d (Twilight Zone)

  // --------------------
  // Dark Theme Colors (darker and higher contrast)
  // --------------------
  static const Color darkBackground = Color(0xFF1B1F3B); // darker Midnight Blue
  static const Color darkSurface = Color(0xFF2D3250); // darker Dark Blue
  static const Color darkTextPrimary = Color(0xFFB0B6D8); // readable on dark bg
  static const Color darkTextSecondary =
      secondary; // lighter Twilight Zone for contrast
  static const Color darkAccent = secondary; // Sun Orange
  static const Color darkError = Color(0xFFFF8A80);
  static const Color darkOnError = Colors.black;

  // --------------------
  // Gradients
  // --------------------
  static const LinearGradient backgroundGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      white,
      primary,
    ],
  );

  static const LinearGradient backgroundGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      darkBackground,
      darkSurface,
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
