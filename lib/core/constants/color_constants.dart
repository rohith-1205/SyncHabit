import 'package:flutter/material.dart';

class ColorConstants {
  // Primary Backgrounds
  static const Color bgDark = Color(0xFF05010F);
  static const Color bgMedium = Color(0xFF0A0418);
  static const Color bgLight = Color(0xFF120522);
  static const Color cardSurface = Color(0x2A1A0B2E);

  // Primary Accents
  static const Color neonViolet = Color(0xFF8B5CF6);
  static const Color electricPurple = Color(0xFFA855F7);
  static const Color pinkNeon = Color(0xFFEC4899);
  static const Color blueGlow = Color(0xFF38BDF8);

  // Text Colors
  static const Color textPrimary = Color(0xFFF5F3FF);
  static const Color textSecondary = Color(0xFFB8A9D9);
  static const Color textMuted = Color(0xFF756A92);

  // Status Colors
  static const Color danger = Color(0xFFFF5A7A);
  static const Color success = Color(0xFF67F7B1);
  static const Color warning = Color(0xFFFBBF24);

  // Gradients
  static const LinearGradient violetPinkGradient = LinearGradient(
    colors: [neonViolet, pinkNeon],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleBlueGradient = LinearGradient(
    colors: [electricPurple, blueGlow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient deepIndigoGradient = LinearGradient(
    colors: [Color(0xFF31105C), neonViolet],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  // Shadows / Glows
  static List<BoxShadow> neonGlow(Color color, {double blurRadius = 12.0}) {
    return [
      BoxShadow(
        color: color.withOpacity(0.4),
        blurRadius: blurRadius,
        spreadRadius: 2,
        offset: const Offset(0, 2),
      ),
    ];
  }
}
