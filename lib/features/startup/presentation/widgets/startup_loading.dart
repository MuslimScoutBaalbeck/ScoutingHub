import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';

class StartupLoading extends StatelessWidget {
  const StartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = context.t.startup;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: 34,
                child: CircularProgressIndicator(
                  strokeWidth: 2.8,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                t.loading,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
