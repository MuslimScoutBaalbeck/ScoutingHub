import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/people/people_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class PeoplePage extends StatelessWidget implements AutoRouteWrapper {
  const PeoplePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PeopleCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return Scaffold(
      appBar: AppBar(title: Text(strings.title)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showComingSoon(context),
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: Text(strings.add),
      ),
      body: BlocBuilder<PeopleCubit, PeopleState>(
        builder: (context, state) {
          if (state.isLoading && state.people.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.people.isEmpty) {
            return Center(
              child: Padding(
                padding: AppSpacing.page,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText.paragraph(
                      strings.unexpected_error,
                      textAlign: TextAlign.center,
                    ),
                    AppGap.verticalMd,
                    AppButton.filled(
                      label: strings.retry,
                      onPressed: context.read<PeopleCubit>().load,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView(
            padding: AppSpacing.pageWithBottom,
            children: [
              AppPageHeader(title: strings.title, subtitle: strings.subtitle),
              AppGap.verticalLg,
              TextField(
                onChanged: context.read<PeopleCubit>().search,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: strings.search,
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
              ),
              AppGap.verticalLg,
              if (state.filteredPeople.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
                  child: AppText.paragraph(
                    strings.empty,
                    textAlign: TextAlign.center,
                  ),
                )
              else
                ...state.filteredPeople.map(
                  (person) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _PersonCard(person: person),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(context.t.home.common.coming_soon)),
      );
  }
}

class _PersonCard extends StatelessWidget {
  const _PersonCard({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;
    final colors = Theme.of(context).colorScheme;
    final stage = switch (person.stage) {
      ScoutStage.cub => strings.stages.cub,
      ScoutStage.scout => strings.stages.scout,
      ScoutStage.rover => strings.stages.rover,
      ScoutStage.leader => strings.stages.leader,
    };
    final status = switch (person.status) {
      PersonStatus.active => strings.active,
      PersonStatus.pending => strings.pending,
      PersonStatus.inactive => strings.inactive,
      PersonStatus.archived => strings.archived,
    };

    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundColor: colors.primaryContainer,
          foregroundColor: colors.primary,
          child: Text(person.fullName.characters.first.toUpperCase()),
        ),
        title: AppText.body(person.fullName, fontWeight: FontWeight.w700),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xxs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.caption('$stage · ${person.unit}'),
              AppText.caption(
                '${strings.membership_number}: ${person.membershipNumber}',
                color: colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText.caption(status, fontWeight: FontWeight.w700),
            AppGap.verticalXxs,
            Icon(
              person.profileComplete
                  ? Icons.verified_rounded
                  : Icons.warning_amber_rounded,
              size: AppSize.iconSm,
              color: person.profileComplete ? colors.primary : colors.error,
            ),
          ],
        ),
      ),
    );
  }
}
