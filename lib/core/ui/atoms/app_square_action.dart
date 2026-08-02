import 'package:flutter/material.dart';

class AppSquareAction extends StatelessWidget {
  const AppSquareAction({
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.dimension = 42,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final button = Material(
      color: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colors.primary.withValues(alpha: .45),
          width: 1.4,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox.square(
          dimension: dimension,
          child: IconTheme(
            data: IconThemeData(color: colors.primary, size: 21),
            child: DefaultTextStyle.merge(
              style: TextStyle(
                color: colors.primary,
                fontWeight: FontWeight.w700,
              ),
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );

    final message = tooltip;
    return message == null ? button : Tooltip(message: message, child: button);
  }
}
