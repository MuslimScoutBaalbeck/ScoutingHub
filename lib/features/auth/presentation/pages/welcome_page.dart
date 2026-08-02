import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.welcome;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.explore_outlined, size: 88),
                  const SizedBox(height: 32),
                  Text(
                    strings.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    strings.subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 40),
                  FilledButton(
                    onPressed: () => context.router.push(const LoginRoute()),
                    child: Text(strings.login),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => context.router.push(const RegisterRoute()),
                    child: Text(strings.register),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.router.replaceAll([const HomeRoute()]),
                    child: Text(strings.continue_as_guest),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
