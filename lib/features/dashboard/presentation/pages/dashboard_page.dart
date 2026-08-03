import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/auth/domain/entities/scout_assignment.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            titleSpacing: AppSpacing.lg,
            title: BlocBuilder<SessionCubit, SessionState>(
              buildWhen: (previous, current) =>
                  previous.user != current.user,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.caption(strings.welcome_back),
                    AppText.title(
                      state.user?.name ?? strings.user_name,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                );
              },
            ),
            actions: [
              AppSquareAction(
                tooltip: strings.notifications,
                onPressed: () => _showComingSoon(context),
                child: const Badge(
                  child: Icon(Icons.notifications_outlined),
                ),
              ),
              AppGap.horizontalMd,
            ],
          ),
          SliverPadding(
            padding: AppSpacing.pageWithBottom,
            sliver: SliverList.list(
              children: [
                const _AssignmentSwitcher(),
                AppGap.verticalLg,
                Card(
                  color: colors.primaryContainer,
                  child: Padding(
                    padding: AppSpacing.cardLarge,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.event_available_rounded,
                          color: colors.primary,
                        ),
                        AppGap.horizontalMd,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.caption(
                                strings.upcoming_title,
                                color: colors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                              AppGap.verticalXs,
                              AppText.title(
                                strings.upcoming_name,
                                fontWeight: FontWeight.w700,
                              ),
                              AppGap.verticalXxs,
                              AppText.paragraph(strings.upcoming_details),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppGap.verticalLg,
                AppSectionHeader(title: strings.quick_access),
                AppGap.verticalMd,
                const _QuickAccessGrid(),
              ],
            ),
          ),
        ],
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

class _AssignmentSwitcher extends StatelessWidget {
  const _AssignmentSwitcher();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;

    return BlocBuilder<SessionCubit, SessionState>(
      buildWhen: (previous, current) =>
          previous.assignments != current.assignments ||
          previous.activeAssignmentId != current.activeAssignmentId,
      builder: (context, state) {
        final assignments = state.assignments;

        if (assignments.isEmpty) {
          return Card(
            child: Padding(
              padding: AppSpacing.card,
              child: AppText.paragraph(strings.no_assignment),
            ),
          );
        }

        return DropdownButtonFormField<int>(
          initialValue: state.activeAssignmentId,
          decoration: InputDecoration(
            labelText: strings.active_assignment,
            prefixIcon: const Icon(Icons.badge_outlined),
          ),
          items: assignments
              .map(
                (assignment) => DropdownMenuItem<int>(
                  value: assignment.id,
                  child: Text(_assignmentLabel(assignment)),
                ),
              )
              .toList(growable: false),
          onChanged: assignments.length == 1
              ? null
              : (assignmentId) {
                  if (assignmentId != null) {
                    context.read<SessionCubit>().selectAssignment(assignmentId);
                  }
                },
        );
      },
    );
  }

  String _assignmentLabel(ScoutAssignment assignment) {
    return '${assignment.positionName} — ${assignment.unitName}';
  }
}

class _QuickAccessGrid extends StatelessWidget {
  const _QuickAccessGrid();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;
    final user = context.watch<SessionCubit>().state.user;
    final items = <_QuickAccessItem>[
      _QuickAccessItem(
        icon: Icons.event_rounded,
        label: strings.events,
        permissions: const [AppPermission.eventsView],
      ),
      _QuickAccessItem(
        icon: Icons.task_alt_rounded,
        label: strings.tasks,
        permissions: const [AppPermission.tasksView],
      ),
      _QuickAccessItem(
        icon: Icons.groups_rounded,
        label: strings.teams,
        permissions: const [AppPermission.teamsView],
      ),
      _QuickAccessItem(
        icon: Icons.people_alt_rounded,
        label: strings.members,
        permissions: const [AppPermission.membersView],
      ),
      _QuickAccessItem(
        icon: Icons.music_note_rounded,
        label: strings.chants,
        permissions: const [AppPermission.chantsView],
      ),
      _QuickAccessItem(
        icon: Icons.inventory_2_outlined,
        label: strings.inventory,
        permissions: const [AppPermission.inventoryView],
      ),
    ];
    final visibleItems = items
        .where((item) => user?.hasAnyPermission(item.permissions) ?? false)
        .toList(growable: false);

    if (visibleItems.isEmpty) {
      return AppText.paragraph(strings.no_modules);
    }

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.sm,
      crossAxisSpacing: AppSpacing.sm,
      childAspectRatio: .95,
      children: visibleItems
          .map(
            (item) => _QuickAccessTile(
              icon: item.icon,
              label: item.label,
            ),
          )
          .toList(growable: false),
    );
  }
}

class _QuickAccessTile extends StatelessWidget {
  const _QuickAccessTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        borderRadius: AppRadius.large,
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(context.t.home.common.coming_soon)),
            );
        },
        child: Padding(
          padding: AppSpacing.cardSmall,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: colors.primaryContainer,
                foregroundColor: colors.primary,
                child: Icon(icon),
              ),
              AppGap.verticalSm,
              AppText.paragraph(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _QuickAccessItem {
  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.permissions,
  });

  final IconData icon;
  final String label;
  final List<AppPermission> permissions;
}
