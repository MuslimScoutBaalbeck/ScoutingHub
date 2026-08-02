import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_text.dart';

class AppPageHeader extends StatelessWidget {
  const AppPageHeader({
    required this.title,
    super.key,
    this.subtitle,
    this.leading,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null) ...[leading!, AppGap.horizontalMd],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading(title),
              if (subtitle != null) ...[
                AppGap.verticalXs,
                AppText.paragraph(
                  subtitle!,
                  color: colors.onSurfaceVariant,
                ),
              ],
            ],
          ),
        ),
        if (actions.isNotEmpty) ...[
          AppGap.horizontalMd,
          Wrap(spacing: AppSpacing.xs, children: actions),
        ],
      ],
    );
  }
}