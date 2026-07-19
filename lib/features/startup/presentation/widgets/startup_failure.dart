import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/features/startup/presentation/widgets/startup_error.dart';

class StartupFailure extends StatelessWidget {
  const StartupFailure({
    required this.error,
    required this.onRetry,
    super.key,
  });

  final String? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final t = context.t.startup;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 640;

        return Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(isCompact ? 8 : 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isCompact ? double.infinity : 560,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colorScheme.outlineVariant),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.08),
                      blurRadius: 28,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isCompact ? 10 : 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: colorScheme.errorContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.error_outline_rounded,
                            size: isCompact ? 42 : 52,
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        t.failure_title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (error != null && error!.trim().isNotEmpty) ...[
                        const SizedBox(height: 8),
                        StartupErrorDetails(error: error!),
                      ],
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: onRetry,
                          icon: const Icon(Icons.refresh_rounded),
                          label: Text(t.retry),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
