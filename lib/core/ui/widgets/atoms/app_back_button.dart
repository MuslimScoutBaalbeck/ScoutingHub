import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/app_size.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    final colors = Theme.of(context).colorScheme;

    return IconButton(
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      icon: Icon(
        direction == TextDirection.rtl
            ? Icons.chevron_right_rounded
            : Icons.chevron_left_rounded,
        size: AppSize.iconMd,
        color: colors.onSurface,
      ),
    );
  }
}
