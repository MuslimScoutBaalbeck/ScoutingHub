import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_gap.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_text.dart';

class AppAccessDenied extends StatelessWidget {
  const AppAccessDenied({
    required this.message,
    super.key,
    this.title,
    this.icon = Icons.lock_outline_rounded,
  });

  final String message;
  final String? title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: AppSpacing.page,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSize.contentMaxWidth,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: AppSize.iconXl, color: colors.primary),
                if (title != null) ...[
                  AppGap.verticalMd,
                  AppText.title(
                    title!,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                  ),
                ],
                AppGap.verticalSm,
                AppText.paragraph(
                  message,
                  textAlign: TextAlign.center,
                  color: colors.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
