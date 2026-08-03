import 'package:flutter/material.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_square_action.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: AppSquareAction(
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: onPressed ?? () => Navigator.maybePop(context),
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
