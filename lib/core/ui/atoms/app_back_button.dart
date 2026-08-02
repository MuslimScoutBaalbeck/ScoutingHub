import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/ui/atoms/app_square_action.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({this.tooltip, super.key});

  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: AppSquareAction(
        tooltip: tooltip ?? MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: () => context.router.maybePop(),
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
