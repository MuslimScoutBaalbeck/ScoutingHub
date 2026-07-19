import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_cubit.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_state.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/presentation/chant_ui_strings.dart';
import 'package:scouting_hub/features/chants/presentation/pages/chant_details_page.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class ChantLibraryPage extends StatelessWidget {
  const ChantLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final strings = ChantUiStrings(languageCode);

    return Scaffold(
      appBar: AppBar(title: Text(strings.library)),
      body: BlocBuilder<ChantCatalogCubit, ChantCatalogState>(
        builder: (context, state) {
          if (state.status == ChantCatalogStatus.loading && state.chants.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == ChantCatalogStatus.failure && state.chants.isEmpty) {
            return _FailureView(
              message: strings.loadFailed,
              retryLabel: strings.retry,
              onRetry: context.read<ChantCatalogCubit>().load,
            );
          }

          final chants = state.filteredChants(languageCode);

          return RefreshIndicator(
            onRefresh: context.read<ChantCatalogCubit>().load,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: SearchBar(
                      hintText: strings.searchHint,
                      leading: const Icon(TablerIcons.search),
                      onChanged: context.read<ChantCatalogCubit>().search,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 58,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length + 1,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final isAll = index == 0;
                        final category = isAll ? null : state.categories[index - 1];
                        final id = category?.id;
                        final selected = state.selectedCategoryId == id;

                        return ChoiceChip(
                          selected: selected,
                          label: Text(
                            isAll ? strings.all : category!.nameFor(languageCode),
                          ),
                          onSelected: (_) =>
                              context.read<ChantCatalogCubit>().selectCategory(id),
                        );
                      },
                    ),
                  ),
                ),
                if (chants.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text(strings.empty)),
                  )
                else
                  SliverList.separated(
                    itemCount: chants.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final chant = chants[index];
                      return _ChantTile(
                        chant: chant,
                        languageCode: languageCode,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => ChantDetailsPage(chant: chant),
                          ),
                        ),
                      );
                    },
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChantTile extends StatelessWidget {
  const _ChantTile({
    required this.chant,
    required this.languageCode,
    required this.onTap,
  });

  final Chant chant;
  final String languageCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          chant.hasYoutube ? TablerIcons.brandYoutube : TablerIcons.music,
        ),
      ),
      title: Text(
        chant.titleFor(languageCode),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(chant.code),
      trailing: const Icon(TablerIcons.chevronRight),
      onTap: onTap,
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
  });

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(TablerIcons.alertCircle, size: 44),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}
