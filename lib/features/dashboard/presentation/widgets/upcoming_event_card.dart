import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({
    required this.eyebrow,
    required this.title,
    required this.details,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.primaryContainer,
      child: Padding(
        padding: AppSpacing.cardLarge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.event_available_rounded, color: colors.primary),
            AppGap.horizontalMd,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.caption(
                    eyebrow,
                    color: colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                  AppGap.verticalXs,
                  AppText.title(title, fontWeight: FontWeight.w700),
                  AppGap.verticalXxs,
                  AppText.paragraph(details),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
