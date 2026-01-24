import 'package:flutter/material.dart';

class AppColors {
  // --- Core Brand Colors ---
  // A warm, deep "Onyx" - softer and classier than pure black
  static const Color primary = Color(0xFF1C1C1C);
  // "Champagne Gold" - the definition of class and prestige
  static const Color secondary = Color(0xFFD4AF37);
  static const Color white = Color(0xFFFDFDFD);
  static const Color error = Color(0xFFB22222); // Classic deep red
  static const Color onError = white;

  // --- Light Theme (Ivory & Charcoal) ---
  static const Color lightBackground =
      Color(0xFFF9F7F2); // Premium paper/ivory feel
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF1C1C1C);
  static const Color lightTextSecondary = Color(0xFF555555);

  // --- Dark Theme (Executive Night) ---
  static const Color darkBackground = Color(0xFF121212); // Deep charcoal
  static const Color darkSurface = Color(0xFF1E1E1E); // Slightly lifted surface
  static const Color darkTextPrimary = Color(0xFFE5E5E5); // Soft silver/white
  static const Color darkTextSecondary = Color(0xFFA0A0A0); // Muted grey
  static const Color darkAccent = Color(0xFFD4AF37); // Gold
  static const Color darkError = Color(0xFFCF6679);
  static const Color darkOnError = Colors.black;

  // --- Mind-Blowing Gradients ---
  // A soft "Silk" transition for the light theme
  static const LinearGradient backgroundGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF9F7F2),
      Color(0xFFE8E4D9),
    ],
  );

  // Subtle "Midnight Sheen" for the dark theme
  static const LinearGradient backgroundGradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1C1C1C),
      Color(0xFF000000),
    ],
  );

  // The "Metallic Gold" Gradient for premium buttons/headers
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD4AF37), // Metallic Gold
      Color(0xFFAA8831), // Deep Bronze-Gold
    ],
  );
}
