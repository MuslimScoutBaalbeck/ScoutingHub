import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/people/people_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MembersDashboardPage extends StatelessWidget implements AutoRouteWrapper {
  const MembersDashboardPage({super.key});

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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.dashboard),
            Text(
              strings.dashboard_subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: strings.add,
        onPressed: () => context.router.push(const MemberFormRoute()),
        child: const Icon(Icons.person_add_alt_1_rounded),
      ),
      body: BlocBuilder<PeopleCubit, PeopleState>(
        builder: (context, state) {
          if (state.isLoading && state.people.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final active = state.people
              .where((person) => person.status == PersonStatus.active)
              .length;
          final incomplete = state.people
              .where((person) => !person.profileComplete)
              .length;
          final pending = state.people
              .where((person) => person.status == PersonStatus.pending)
              .length;

          return ListView(
            padding: AppSpacing.pageWithBottom,
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSpacing.sm,
                crossAxisSpacing: AppSpacing.sm,
                childAspectRatio: 1.45,
                children: [
                  _MetricCard(
                    label: strings.total_members,
                    value: state.people.length,
                    icon: Icons.groups_rounded,
                  ),
                  _MetricCard(
                    label: strings.active_members,
                    value: active,
                    icon: Icons.verified_user_outlined,
                  ),
                  _MetricCard(
                    label: strings.pending_requests,
                    value: pending,
                    icon: Icons.pending_actions_rounded,
                  ),
                  _MetricCard(
                    label: strings.incomplete_profiles,
                    value: incomplete,
                    icon: Icons.warning_amber_rounded,
                  ),
                ],
              ),
              AppGap.verticalLg,
              _DashboardAction(
                icon: Icons.people_alt_outlined,
                title: strings.members_list,
                onTap: () => context.router.push(const MembersListRoute()),
              ),
              _DashboardAction(
                icon: Icons.how_to_reg_outlined,
                title: strings.membership_requests,
                badge: pending,
                onTap: () => context.router.push(
                  const MembershipRequestsRoute(),
                ),
              ),
              _DashboardAction(
                icon: Icons.analytics_outlined,
                title: strings.reports,
                onTap: () => context.router.push(const MemberReportsRoute()),
              ),
              AppGap.verticalLg,
              AppSectionHeader(title: strings.recent_members),
              AppGap.verticalSm,
              for (final person in state.people.take(4))
                Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: ListTile(
                    dense: true,
                    leading: CircleAvatar(
                      child: Text(person.fullName.characters.first),
                    ),
                    title: AppText.body(
                      person.fullName,
                      fontWeight: FontWeight.w700,
                    ),
                    subtitle: AppText.caption(person.unit),
                    onTap: () => context.router.push(
                      MemberDetailsRoute(person: person),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final int value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: colors.primary),
            AppText.heading('$value', fontWeight: FontWeight.w800),
            AppText.caption(
              label,
              color: colors.onSurfaceVariant,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardAction extends StatelessWidget {
  const _DashboardAction({
    required this.icon,
    required this.title,
    required this.onTap,
    this.badge,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final int? badge;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: AppText.body(title, fontWeight: FontWeight.w700),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badge case final value? when value > 0)
              Badge(label: Text('$value')),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
