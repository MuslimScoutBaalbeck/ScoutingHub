import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/app_size.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_square_action.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness==.dark;
    return Padding(
      padding: const EdgeInsetsDirectional.all(8),
      child: AppSquareAction(
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: onPressed ?? () => Navigator.maybePop(context),
        child: Icon(
          Icons.chevron_left,
          size: AppSize.iconSm,
          color: isDark?colors.onPrimary:colors.primary,
        ),
      ),
    );
  }
}
