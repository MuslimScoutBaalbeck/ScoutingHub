import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:scouting_hub/core/ui/app_colors.dart';
import 'package:scouting_hub/core/ui/theme/scouting_hub_brand.dart';

abstract final class ScoutingHubTheme {
  static final FThemeData lightTouch = _build(
    brightness: Brightness.light,
    touch: true,
  );

  static final FThemeData darkTouch = _build(
    brightness: Brightness.dark,
    touch: true,
  );

  static final FThemeData lightDesktop = _build(
    brightness: Brightness.light,
    touch: false,
  );

  static final FThemeData darkDesktop = _build(
    brightness: Brightness.dark,
    touch: false,
  );

  static ({FThemeData light, FThemeData dark}) forPlatform(
    TargetPlatform platform,
  ) {
    final touch = switch (platform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.fuchsia => true,
      _ => false,
    };

    return touch
        ? (light: lightTouch, dark: darkTouch)
        : (light: lightDesktop, dark: darkDesktop);
  }

  static FThemeData _build({
    required Brightness brightness,
    required bool touch,
  }) {
    final dark = brightness == Brightness.dark;
    final base = switch ((brightness, touch)) {
      (Brightness.light, true) => FTheme.neutral.light.touch,
      (Brightness.light, false) => FTheme.neutral.light.desktop,
      (Brightness.dark, true) => FTheme.neutral.dark.touch,
      (Brightness.dark, false) => FTheme.neutral.dark.desktop,
    };

    final colors = base.colors.copyWith(
      brightness: brightness,
      systemOverlayStyle:
          dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      barrier: dark ? const Color(0x99000000) : const Color(0x66000000),
      background: dark ? const Color(0xFF101512) : AppColors.surfaceLight,
      foreground: dark ? const Color(0xFFF3F7F4) : AppColors.ink,
      primary: dark ? const Color(0xFF53B98D) : AppColors.scoutGreen,
      primaryForeground: dark ? const Color(0xFF081B14) : Colors.white,
      secondary: dark ? const Color(0xFF2C2340) : const Color(0xFFEDE7F5),
      secondaryForeground:
          dark ? const Color(0xFFF7F2FF) : AppColors.scoutPurple,
      muted: dark ? const Color(0xFF202722) : const Color(0xFFE9EEE9),
      mutedForeground:
          dark ? const Color(0xFFABB8B0) : const Color(0xFF647067),
      destructive: dark ? const Color(0xFFFF6B6B) : const Color(0xFFB42318),
      destructiveForeground: Colors.white,
      error: dark ? const Color(0xFFFF6B6B) : const Color(0xFFB42318),
      errorForeground: Colors.white,
      card: dark ? const Color(0xFF171D19) : Colors.white,
      border: dark ? const Color(0xFF303A33) : const Color(0xFFD9E1DA),
    );

    return FThemeData(
      debugLabel: 'Scouting Hub ${dark ? 'dark' : 'light'} '
          '${touch ? 'touch' : 'desktop'}',
      colors: colors,
      touch: touch,
      breakpoints: base.breakpoints,
      typography: base.typography,
      icons: base.icons,
      style: base.style,
      hapticFeedback: base.hapticFeedback,
      extensions: [
        dark ? ScoutingHubBrand.dark : ScoutingHubBrand.light,
      ],
    );
  }
}
