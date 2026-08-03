import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({
    required this.eyebrow,
    required this.title,
    required this.details,
    super.key,
    this.onPressed,
  });

  final String eyebrow;
  final String title;
  final String details;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.extraLarge,
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            colors.primary,
            colors.primary.withValues(alpha: .82),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppRadius.extraLarge,
          child: Padding(
            padding: AppSpacing.cardLarge,
            child: Stack(
              children: [
                PositionedDirectional(
                  end: -8,
                  bottom: -18,
                  child: Icon(
                    Icons.terrain_rounded,
                    size: 132,
                    color: colors.onPrimary.withValues(alpha: .16),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 154),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.caption(
                        eyebrow,
                        color: colors.onPrimary.withValues(alpha: .82),
                        fontWeight: FontWeight.w700,
                      ),
                      AppGap.verticalSm,
                      AppText.title(
                        title,
                        color: colors.onPrimary,
                        fontWeight: FontWeight.w800,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppGap.verticalXs,
                      AppText.paragraph(
                        details,
                        color: colors.onPrimary.withValues(alpha: .88),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText.body(
                            eyebrow,
                            color: colors.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                          AppGap.horizontalXs,
                          Icon(
                            Directionality.of(context) == TextDirection.rtl
                                ? Icons.arrow_back_rounded
                                : Icons.arrow_forward_rounded,
                            size: AppSize.iconSm,
                            color: colors.onPrimary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
