import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const String fontFamily = 'IBM Plex Sans Arabic';

  static const Color brandPurple = Color(0xFF652390);
  static const Color brandPurpleDark = Color(0xFF8F5CC2);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF0D0D12);
  static const Color darkSurface = Color(0xFF15151D);

  static ThemeData get light {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: brandPurple,
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
      inputFillColor: lightBackground,
    );
  }

  static ThemeData get dark {
    final colorScheme =
        ColorScheme.fromSeed(
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
      inputFillColor: darkBackground,
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color inputFillColor,
  }) {
    final borderRadius = BorderRadius.circular(14);
    final textTheme = ThemeData(
      brightness: colorScheme.brightness,
      fontFamily: fontFamily,
    ).textTheme.apply(
      fontFamily: fontFamily,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      fontFamily: fontFamily,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        prefixIconColor: colorScheme.onSurfaceVariant,
        suffixIconColor: colorScheme.onSurfaceVariant,
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
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: .5),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withValues(alpha: .45),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.outlineVariant),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
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
        contentTextStyle: TextStyle(
          color: colorScheme.onInverseSurface,
          fontFamily: fontFamily,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
