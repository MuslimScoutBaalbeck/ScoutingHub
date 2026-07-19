import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

@immutable
class ScoutingHubBrand extends ThemeExtension<ScoutingHubBrand> {
  const ScoutingHubBrand({
    required this.scoutGreen,
    required this.forestGreen,
    required this.scoutPurple,
    required this.softPurple,
    required this.warmSand,
    required this.campfire,
    required this.youtube,
    required this.heroStart,
    required this.heroEnd,
  });

  static const light = ScoutingHubBrand(
    scoutGreen: Color(0xFF0E4D3A),
    forestGreen: Color(0xFF1F6A4F),
    scoutPurple: Color(0xFF4B2E83),
    softPurple: Color(0xFF7B5BA7),
    warmSand: Color(0xFFF2EBD9),
    campfire: Color(0xFFD97706),
    youtube: Color(0xFFFF0033),
    heroStart: Color(0xFF0B5139),
    heroEnd: Color(0xFF4B2E83),
  );

  static const dark = ScoutingHubBrand(
    scoutGreen: Color(0xFF53B98D),
    forestGreen: Color(0xFF2F8B67),
    scoutPurple: Color(0xFFA78BDA),
    softPurple: Color(0xFFC3AFE8),
    warmSand: Color(0xFF3A3428),
    campfire: Color(0xFFF59E0B),
    youtube: Color(0xFFFF4766),
    heroStart: Color(0xFF123D31),
    heroEnd: Color(0xFF39275D),
  );

  final Color scoutGreen;
  final Color forestGreen;
  final Color scoutPurple;
  final Color softPurple;
  final Color warmSand;
  final Color campfire;
  final Color youtube;
  final Color heroStart;
  final Color heroEnd;

  LinearGradient get heroGradient => LinearGradient(
        colors: [heroStart, heroEnd],
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
      );

  @override
  ScoutingHubBrand copyWith({
    Color? scoutGreen,
    Color? forestGreen,
    Color? scoutPurple,
    Color? softPurple,
    Color? warmSand,
    Color? campfire,
    Color? youtube,
    Color? heroStart,
    Color? heroEnd,
  }) {
    return ScoutingHubBrand(
      scoutGreen: scoutGreen ?? this.scoutGreen,
      forestGreen: forestGreen ?? this.forestGreen,
      scoutPurple: scoutPurple ?? this.scoutPurple,
      softPurple: softPurple ?? this.softPurple,
      warmSand: warmSand ?? this.warmSand,
      campfire: campfire ?? this.campfire,
      youtube: youtube ?? this.youtube,
      heroStart: heroStart ?? this.heroStart,
      heroEnd: heroEnd ?? this.heroEnd,
    );
  }

  @override
  ScoutingHubBrand lerp(
    covariant ScoutingHubBrand? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return ScoutingHubBrand(
      scoutGreen: Color.lerp(scoutGreen, other.scoutGreen, t)!,
      forestGreen: Color.lerp(forestGreen, other.forestGreen, t)!,
      scoutPurple: Color.lerp(scoutPurple, other.scoutPurple, t)!,
      softPurple: Color.lerp(softPurple, other.softPurple, t)!,
      warmSand: Color.lerp(warmSand, other.warmSand, t)!,
      campfire: Color.lerp(campfire, other.campfire, t)!,
      youtube: Color.lerp(youtube, other.youtube, t)!,
      heroStart: Color.lerp(heroStart, other.heroStart, t)!,
      heroEnd: Color.lerp(heroEnd, other.heroEnd, t)!,
    );
  }
}

extension ScoutingHubThemeDataExtension on FThemeData {
  ScoutingHubBrand get scoutingHub => extension<ScoutingHubBrand>();
}
