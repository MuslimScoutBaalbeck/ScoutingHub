import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/members_dashboard/members_dashboard_cubit.dart';

@RoutePage()
class MembersDashboardPage extends StatelessWidget implements AutoRouteWrapper {
  const MembersDashboardPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<MembersDashboardCubit>();
        unawaited(cubit.load());
        return cubit;
      },
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
        onPressed: () async {
          final saved = await context.router.push<bool>(
            const MemberCreateWizardRoute(),
          );
          if (saved == true && context.mounted) {
            await context.read<MembersDashboardCubit>().load();
          }
        },
        child: const Icon(Icons.person_add_alt_1_rounded),
      ),
      body: BlocBuilder<MembersDashboardCubit, MembersDashboardState>(
        builder: (context, state) {
          if (state.isLoading && state.members.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.members.isEmpty) {
            return Center(
              child: AppButton.filled(
                label: strings.retry,
                onPressed: context.read<MembersDashboardCubit>().load,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: context.read<MembersDashboardCubit>().load,
            child: ListView(
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
                      value: state.totalCount,
                      icon: Icons.groups_rounded,
                    ),
                    _MetricCard(
                      label: strings.active_members,
                      value: state.activeCount,
                      icon: Icons.verified_user_outlined,
                    ),
                    _MetricCard(
                      label: strings.pending_requests,
                      value: state.pendingCount,
                      icon: Icons.pending_actions_rounded,
                    ),
                    _MetricCard(
                      label: strings.incomplete_profiles,
                      value: state.incompleteCount,
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
                  badge: state.pendingCount,
                  onTap: () =>
                      context.router.push(const MembershipRequestsRoute()),
                ),
                _DashboardAction(
                  icon: Icons.analytics_outlined,
                  title: strings.reports,
                  onTap: () => context.router.push(const MemberReportsRoute()),
                ),
                AppGap.verticalLg,
                AppSectionHeader(title: strings.recent_members),
                AppGap.verticalSm,
                for (final member in state.recentMembers)
                  Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        child: Text(member.fullName.characters.first),
                      ),
                      title: AppText.body(
                        member.fullName,
                        fontWeight: FontWeight.w700,
                      ),
                      subtitle: AppText.caption(member.unit),
                      onTap: () => context.router.push(
                        MemberDetailsRoute(person: member),
                      ),
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
