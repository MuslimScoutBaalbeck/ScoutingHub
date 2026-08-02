import 'package:flutter/widgets.dart';
import 'package:scouting_hub/core/theme/tokens/app_spacing.dart';

abstract final class AppGap {
  static const xxs = SizedBox.square(dimension: AppSpacing.xxs);
  static const xs = SizedBox.square(dimension: AppSpacing.xs);
  static const sm = SizedBox.square(dimension: AppSpacing.sm);
  static const md = SizedBox.square(dimension: AppSpacing.md);
  static const lg = SizedBox.square(dimension: AppSpacing.lg);
  static const xl = SizedBox.square(dimension: AppSpacing.xl);
  static const xxl = SizedBox.square(dimension: AppSpacing.xxl);

  static const horizontalXs = SizedBox(width: AppSpacing.xs);
  static const horizontalSm = SizedBox(width: AppSpacing.sm);
  static const horizontalMd = SizedBox(width: AppSpacing.md);
  static const horizontalLg = SizedBox(width: AppSpacing.lg);

  static const verticalXs = SizedBox(height: AppSpacing.xs);
  static const verticalSm = SizedBox(height: AppSpacing.sm);
  static const verticalMd = SizedBox(height: AppSpacing.md);
  static const verticalLg = SizedBox(height: AppSpacing.lg);
  static const verticalXl = SizedBox(height: AppSpacing.xl);
}