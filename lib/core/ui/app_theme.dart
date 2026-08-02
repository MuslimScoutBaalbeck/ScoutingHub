import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color brandPurple = Color(0xFF652390);
  static const Color brandPurpleDark = Color(0xFF8F5CC2);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF0D0D12);
  static const Color darkSurface = Color(0xFF15151D);

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: brandPurple,
      brightness: Brightness.light,
      surface: lightBackground,
    ).copyWith(
      primary: brandPurple,
      onPrimary: Colors.white,
      surface: lightBackground,
      onSurface: const Color(0xFF1B1820),
      surfaceContainerLowest: lightBackground,
      surfaceContainerLow: const Color(0xFFF8F7FA),
      surfaceContainer: const Color(0xFFF3F1F6),
      surfaceContainerHigh: const Color(0xFFEDE9F1),
      outline: const Color(0xFFD7D1DC),
      outlineVariant: const Color(0xFFE8E3EC),
    );

    return _buildTheme(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: lightBackground,
      inputFillColor: const Color(0xFFF8F7FA),
    );
  }

  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: brandPurple,
      brightness: Brightness.dark,
      surface: darkBackground,
    ).copyWith(
      primary: brandPurpleDark,
      onPrimary: Colors.white,
      surface: darkBackground,
      onSurface: const Color(0xFFF3EFF7),
      surfaceContainerLowest: darkBackground,
      surfaceContainerLow: const Color(0xFF121219),
      surfaceContainer: darkSurface,
      surfaceContainerHigh: const Color(0xFF1E1E29),
      outline: const Color(0xFF4B4652),
      outlineVariant: const Color(0xFF302C36),
    );

    return _buildTheme(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: darkBackground,
      inputFillColor: darkSurface,
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color inputFillColor,
  }) {
    final borderRadius = BorderRadius.circular(16);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      fontFamily: 'IBM Plex Sans',
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.8),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colorScheme.primary),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.primary.withValues(alpha: .14),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
