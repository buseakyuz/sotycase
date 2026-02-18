import 'package:flutter/material.dart';
import '../constants/soty_colors.dart';
import 'custom_text_theme.dart';

@immutable
final class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: SotyColors.primary,
        primary: SotyColors.primary,
        surface: Colors.white,
        error: SotyColors.error,
      ),
      scaffoldBackgroundColor: SotyColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: SotyColors.textPrimary),
        titleTextStyle: TextStyle(
          color: SotyColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const CustomTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: SotyColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: SotyColors.lightGray,
      ),
    );
  }
}
