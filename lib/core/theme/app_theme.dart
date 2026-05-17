import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color_constants.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorConstants.bgDark,
      primaryColor: ColorConstants.neonViolet,
      colorScheme: const ColorScheme.dark(
        primary: ColorConstants.neonViolet,
        secondary: ColorConstants.pinkNeon,
        surface: ColorConstants.bgMedium,
        error: ColorConstants.danger,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: baseTextTheme.displayLarge?.copyWith(
          color: ColorConstants.textPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
          fontSize: 36,
        ),
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          color: ColorConstants.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          fontSize: 28,
        ),
        headlineLarge: baseTextTheme.headlineLarge?.copyWith(
          color: ColorConstants.textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          color: ColorConstants.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          color: ColorConstants.textPrimary,
          fontSize: 16,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          color: ColorConstants.textSecondary,
          fontSize: 14,
        ),
        labelSmall: baseTextTheme.labelSmall?.copyWith(
          color: ColorConstants.textMuted,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardTheme(
        color: ColorConstants.cardSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.2), width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.neonViolet,
          foregroundColor: ColorConstants.textPrimary,
          elevation: 8,
          shadowColor: ColorConstants.neonViolet.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
