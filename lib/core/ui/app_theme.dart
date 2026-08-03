import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          surface: AppColors.lightSurface,
        ).copyWith(
          primary: AppColors.brand,
          onPrimary: Colors.white,
          surface: AppColors.lightSurface,
          onSurface: AppColors.lightText,
          surfaceContainerLowest: AppColors.lightBackground,
          surfaceContainerLow: AppColors.lightSurfaceMuted,
          surfaceContainer: const Color(0xFFF3F1F6),
          surfaceContainerHigh: const Color(0xFFEDE9F1),
          outline: const Color(0xFFD7D1DC),
          outlineVariant: const Color(0xFFE8E3EC),
          error: AppColors.error,
        );

    return _buildTheme(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      inputFillColor: AppColors.lightSurface,
    );
  }

  static ThemeData get dark {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          brightness: Brightness.dark,
          surface: AppColors.darkBackground,
        ).copyWith(
          primary: AppColors.brandDark,
          onPrimary: Colors.white,
          surface: AppColors.darkBackground,
          onSurface: AppColors.darkText,
          surfaceContainerLowest: AppColors.darkBackground,
          surfaceContainerLow: AppColors.darkSurfaceMuted,
          surfaceContainer: AppColors.darkSurface,
          surfaceContainerHigh: const Color(0xFF1E1E29),
          outline: const Color(0xFF4B4652),
          outlineVariant: const Color(0xFF302C36),
          error: AppColors.error,
        );

    return _buildTheme(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      inputFillColor: AppColors.darkBackground,
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color inputFillColor,
  }) {
    final textTheme =
        ThemeData(
              brightness: colorScheme.brightness,
              fontFamily: AppTypography.fontFamily,
            ).textTheme
            .apply(
              fontFamily: AppTypography.fontFamily,
              bodyColor: colorScheme.onSurface,
              displayColor: colorScheme.onSurface,
            )
            .copyWith(
              headlineLarge: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.displaySize,
                fontWeight: AppTypography.displayWeight,
                height: AppTypography.compactHeight,
              ),
              headlineSmall: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.headingSize,
                fontWeight: AppTypography.headingWeight,
                height: AppTypography.compactHeight,
              ),
              titleMedium: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.titleSize,
                fontWeight: AppTypography.titleWeight,
              ),
              bodyLarge: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.bodySize,
                fontWeight: AppTypography.bodyWeight,
                height: AppTypography.bodyHeight,
              ),
              bodyMedium: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.paragraphSize,
                fontWeight: AppTypography.bodyWeight,
                height: AppTypography.bodyHeight,
              ),
              bodySmall: TextStyle(
                fontFamily: AppTypography.fontFamily,
                fontSize: AppTypography.captionSize,
                fontWeight: AppTypography.bodyWeight,
              ),
            );

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      fontFamily: AppTypography.fontFamily,
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
          fontWeight: AppTypography.titleWeight,
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.medium,
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        prefixIconColor: colorScheme.onSurfaceVariant,
        suffixIconColor: colorScheme.onSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.8),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSize.controlLg),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.medium),
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: AppTypography.labelWeight,
            fontSize: AppTypography.bodySize,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSize.controlLg),
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.outlineVariant),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.medium),
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: AppTypography.labelWeight,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: AppTypography.labelWeight,
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
          fontFamily: AppTypography.fontFamily,
        ),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.medium),
      ),
    );
  }
}
