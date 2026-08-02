import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/ui/widgets/app_decorative_background.dart';

class StartupLoading extends StatefulWidget {
  const StartupLoading({super.key});

  @override
  State<StartupLoading> createState() => _StartupLoadingState();
}

class _StartupLoadingState extends State<StartupLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    );

    _progress = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final translations = context.t;

    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const AppDecorativeBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 24,
              ),
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  Semantics(
                    image: true,
                    label: translations.app.name,
                    child: SvgPicture.asset(
                      'assets/branding/muslim_scout_logo.svg',
                      width: 150,
                      height: 194,
                      colorFilter: ColorFilter.mode(
                        colors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    translations.app.tagline,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    translations.app.description,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(flex: 2),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Column(
                      children: [
                        Text(
                          translations.startup.loading,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedBuilder(
                          animation: _progress,
                          builder: (context, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: LinearProgressIndicator(
                                minHeight: 7,
                                value: _progress.value * .94,
                                backgroundColor: colors.primary.withValues(
                                  alpha: .12,
                                ),
                                color: colors.primary,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
