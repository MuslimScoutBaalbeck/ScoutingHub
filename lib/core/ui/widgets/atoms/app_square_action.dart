import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';

class AppSquareAction extends StatelessWidget {
  const AppSquareAction({
    required this.tooltip,
    required this.onPressed,
    required this.child,
    super.key,
    this.size = AppSize.controlSm,
  });

  final String tooltip;
  final VoidCallback? onPressed;
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: colors.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.small,
          side: BorderSide(
            color: colors.primary.withValues(alpha: .55),
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: size,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
