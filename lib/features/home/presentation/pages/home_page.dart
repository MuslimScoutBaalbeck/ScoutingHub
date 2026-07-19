import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_cubit.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_state.dart';
import 'package:scouting_hub/features/chants/data/repositories/local_chant_repository.dart';
import 'package:scouting_hub/features/chants/presentation/chant_ui_strings.dart';
import 'package:scouting_hub/features/chants/presentation/pages/chant_library_page.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChantCatalogCubit(const LocalChantRepository())..load(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final strings = ChantUiStrings(languageCode);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.appName),
        actions: [
          IconButton(
            tooltip: languageCode == 'ar' ? 'English' : 'العربية',
            onPressed: () => _changeLanguage(context, languageCode),
            icon: const Icon(TablerIcons.language),
          ),
          IconButton(
            onPressed: () {
              context.read<ApplicationStartCubit>().updateThemeMode(
                    Theme.brightnessOf(context) == Brightness.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
            },
            icon: Icon(
              Theme.brightnessOf(context) == Brightness.light
                  ? TablerIcons.moon
                  : TablerIcons.sun,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ChantCatalogCubit, ChantCatalogState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: context.read<ChantCatalogCubit>().load,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0B5139), Color(0xFF4B2E83)],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        TablerIcons.compass,
                        color: Colors.white,
                        size: 44,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        strings.library,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        strings.explore,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: .86),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      FilledButton.tonalIcon(
                        onPressed: () => _openLibrary(context),
                        icon: const Icon(TablerIcons.music),
                        label: Text(strings.openLibrary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                _SectionHeader(
                  title: strings.categories,
                  onPressed: () => _openLibrary(context),
                ),
                const SizedBox(height: 12),
                if (state.status == ChantCatalogStatus.loading &&
                    state.categories.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (state.status == ChantCatalogStatus.failure &&
                    state.categories.isEmpty)
                  _ErrorCard(
                    message: strings.loadFailed,
                    retryLabel: strings.retry,
                    onRetry: context.read<ChantCatalogCubit>().load,
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.categories.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      mainAxisExtent: 130,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () async {
                          await context
                              .read<ChantCatalogCubit>()
                              .selectCategory(category.id);
                          if (context.mounted) {
                            await _openLibrary(context);
                          }
                        },
                        child: Ink(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: theme.colorScheme.outlineVariant,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                _categoryIcon(category.icon),
                                color: theme.colorScheme.primary,
                                size: 30,
                              ),
                              const Spacer(),
                              Text(
                                category.nameFor(languageCode),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _openLibrary(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider.value(
          value: context.read<ChantCatalogCubit>(),
          child: const ChantLibraryPage(),
        ),
      ),
    );
  }

  Future<void> _changeLanguage(
    BuildContext context,
    String currentLanguageCode,
  ) async {
    final locale = currentLanguageCode == 'ar' ? AppLocale.en : AppLocale.ar;
    await LocaleSettings.setLocale(locale);
    if (context.mounted) {
      context.read<ApplicationStartCubit>().updateLocale(locale.languageCode);
    }
  }

  IconData _categoryIcon(String name) {
    return switch (name) {
      'tent' || 'campfire' => TablerIcons.tent,
      'mosque' => TablerIcons.buildingMosque,
      'hand_wave' => TablerIcons.handStop,
      'cubs' || 'cub' => TablerIcons.paw,
      'rovers' => TablerIcons.backpack,
      _ => TablerIcons.music,
    };
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(TablerIcons.arrowRight),
        ),
      ],
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
  });

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(TablerIcons.alertCircle, size: 36),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}
