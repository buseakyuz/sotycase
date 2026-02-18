import 'package:flutter/material.dart';
import '../constants/soty_colors.dart';

@immutable
final class CustomTextTheme extends TextTheme {
  const CustomTextTheme()
      : super(
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: SotyColors.textPrimary,
          ),
          displayMedium: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: SotyColors.textPrimary,
          ),
          displaySmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: SotyColors.textPrimary,
          ),
          headlineMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: SotyColors.textPrimary,
          ),
          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: SotyColors.textPrimary,
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: SotyColors.textPrimary,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: SotyColors.textPrimary,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: SotyColors.textPrimary,
          ),
          bodySmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: SotyColors.textSecondary,
          ),
          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
}
