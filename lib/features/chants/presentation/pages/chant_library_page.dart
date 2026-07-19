import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_cubit.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_state.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/presentation/chant_ui_strings.dart';
import 'package:scouting_hub/features/chants/presentation/pages/chant_details_page.dart';

class ChantLibraryPage extends StatelessWidget {
  const ChantLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final strings = ChantUiStrings(languageCode);

    return FScaffold(
      childPad: false,
      header: FHeader.nested(
        title: Text(strings.library),
        prefixes: [
          FHeaderAction.back(onPress: () => Navigator.of(context).pop()),
        ],
      ),
      child: BlocBuilder<ChantCatalogCubit, ChantCatalogState>(
        builder: (context, state) {
          if (state.status == ChantCatalogStatus.loading && state.chants.isEmpty) {
            return const Center(child: FCircularProgress());
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
                    child: FTextField(
                      control: .managed(
                        onChange: (value) => context
                            .read<ChantCatalogCubit>()
                            .search(value.text),
                      ),
                      hint: strings.searchHint,
                      prefixBuilder: (_, _, _) =>
                          const Icon(FLucideIcons.search),
                      clearable: (value) => value.text.isNotEmpty,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 54,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length + 1,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final isAll = index == 0;
                        final category = isAll ? null : state.categories[index - 1];
                        final id = category?.id;
                        final selected = state.selectedCategoryId == id;

                        return FButton(
                          variant: selected
                              ? FButtonVariant.primary
                              : FButtonVariant.outline,
                          size: FButtonSize.sm,
                          mainAxisSize: MainAxisSize.min,
                          onPress: () => context
                              .read<ChantCatalogCubit>()
                              .selectCategory(id),
                          child: Text(
                            isAll ? strings.all : category!.nameFor(languageCode),
                          ),
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
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                    sliver: SliverList.separated(
                      itemCount: chants.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final chant = chants[index];
                        return FTile(
                          prefix: Icon(
                            chant.hasYoutube
                                ? FLucideIcons.youtube
                                : FLucideIcons.music,
                          ),
                          title: Text(chant.titleFor(languageCode)),
                          subtitle: Text(chant.code),
                          suffix: const Icon(FLucideIcons.chevronRight),
                          onPress: () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => ChantDetailsPage(chant: chant),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
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
        child: FCard(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(FLucideIcons.circleAlert, size: 44),
                const SizedBox(height: 12),
                Text(message, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FButton(onPress: onRetry, child: Text(retryLabel)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
