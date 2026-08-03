import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/auth/domain/entities/scout_assignment.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home;
    final pages = const [
      _DashboardTab(),
      _TasksTab(),
      _CalendarTab(),
      _MoreTab(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard_rounded),
            label: strings.navigation.dashboard,
          ),
          NavigationDestination(
            icon: const Icon(Icons.task_alt_outlined),
            selectedIcon: const Icon(Icons.task_alt_rounded),
            label: strings.navigation.tasks,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            selectedIcon: const Icon(Icons.calendar_month_rounded),
            label: strings.navigation.calendar,
          ),
          NavigationDestination(
            icon: const Icon(Icons.grid_view_outlined),
            selectedIcon: const Icon(Icons.grid_view_rounded),
            label: strings.navigation.more,
          ),
        ],
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;

    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, sessionState) {
        final user = sessionState.user;
        final quickAccessItems = _buildQuickAccessItems(context, sessionState);

        return SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                titleSpacing: AppSpacing.pageHorizontal,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.caption(strings.welcome_back),
                    AppText.title(user?.name ?? '—'),
                  ],
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
                    _AssignmentSwitcher(state: sessionState),
                    AppGap.verticalLg,
                    _UpcomingEventCard(
                      title: strings.upcoming_title,
                      name: strings.upcoming_name,
                      details: strings.upcoming_details,
                    ),
                    AppGap.verticalXl,
                    AppSectionHeader(title: strings.quick_access),
                    AppGap.verticalMd,
                    if (quickAccessItems.isEmpty)
                      _AccessMessage(message: strings.no_access)
                    else
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: AppSpacing.sm,
                        crossAxisSpacing: AppSpacing.sm,
                        childAspectRatio: .95,
                        children: quickAccessItems,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildQuickAccessItems(
    BuildContext context,
    SessionState state,
  ) {
    final strings = context.t.home.dashboard;
    final user = state.user;

    if (user == null) {
      return const [];
    }

    final definitions = <_QuickAccessDefinition>[
      _QuickAccessDefinition(
        icon: Icons.event_rounded,
        label: strings.events,
        permissions: const [AppPermission.eventsView],
      ),
      _QuickAccessDefinition(
        icon: Icons.task_alt_rounded,
        label: strings.tasks,
        permissions: const [AppPermission.tasksView],
      ),
      _QuickAccessDefinition(
        icon: Icons.groups_rounded,
        label: strings.teams,
        permissions: const [AppPermission.teamsView],
      ),
      _QuickAccessDefinition(
        icon: Icons.people_alt_rounded,
        label: strings.members,
        permissions: const [AppPermission.membersView],
      ),
      _QuickAccessDefinition(
        icon: Icons.music_note_rounded,
        label: strings.chants,
        permissions: const [AppPermission.chantsView],
      ),
      _QuickAccessDefinition(
        icon: Icons.inventory_2_rounded,
        label: strings.inventory,
        permissions: const [AppPermission.inventoryView],
      ),
    ];

    return definitions
        .where((item) => user.hasAnyPermission(item.permissions))
        .map(
          (item) => _QuickAccessTile(
            icon: item.icon,
            label: item.label,
            onTap: () => _showComingSoon(context),
          ),
        )
        .toList(growable: false);
  }
}

class _AssignmentSwitcher extends StatelessWidget {
  const _AssignmentSwitcher({required this.state});

  final SessionState state;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;
    final assignments = state.assignments;
    final activeAssignment = state.activeAssignment;

    if (assignments.isEmpty) {
      return _AccessMessage(message: strings.no_assignment);
    }

    return Card(
      child: Padding(
        padding: AppSpacing.card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppText.caption(strings.active_assignment),
            AppGap.verticalSm,
            DropdownButtonFormField<int>(
              initialValue: activeAssignment?.id,
              isExpanded: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.badge_outlined),
              ),
              items: [
                for (final assignment in assignments)
                  DropdownMenuItem<int>(
                    value: assignment.id,
                    child: _AssignmentLabel(assignment: assignment),
                  ),
              ],
              onChanged: assignments.length == 1
                  ? null
                  : (assignmentId) {
                      if (assignmentId != null) {
                        context
                            .read<SessionCubit>()
                            .selectAssignment(assignmentId);
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}

class _AssignmentLabel extends StatelessWidget {
  const _AssignmentLabel({required this.assignment});

  final ScoutAssignment assignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.body(assignment.positionName, maxLines: 1),
        AppText.caption(assignment.unitName, maxLines: 1),
      ],
    );
  }
}

class _UpcomingEventCard extends StatelessWidget {
  const _UpcomingEventCard({
    required this.title,
    required this.name,
    required this.details,
  });

  final String title;
  final String name;
  final String details;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.primaryContainer,
      child: Padding(
        padding: AppSpacing.card,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.event_available_rounded, color: colors.primary),
            AppGap.horizontalMd,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.caption(title, color: colors.primary),
                  AppGap.verticalXs,
                  AppText.title(name),
                  AppGap.verticalXs,
                  AppText.paragraph(details),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAccessDefinition {
  const _QuickAccessDefinition({
    required this.icon,
    required this.label,
    required this.permissions,
  });

  final IconData icon;
  final String label;
  final List<AppPermission> permissions;
}

class _QuickAccessTile extends StatelessWidget {
  const _QuickAccessTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        borderRadius: AppRadius.large,
        onTap: onTap,
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
              AppText.body(label, textAlign: TextAlign.center, maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _TasksTab extends StatelessWidget {
  const _TasksTab();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.tasks;

    return AppPermissionGate(
      permission: AppPermission.tasksView,
      fallback: SafeArea(
        child: _AccessMessage(message: strings.access_denied),
      ),
      child: SafeArea(
        child: ListView(
          padding: AppSpacing.pageWithBottom,
          children: [
            AppPageHeader(title: strings.title, subtitle: strings.subtitle),
            AppGap.verticalLg,
            _TaskCard(
              title: strings.prepare_meeting,
              progress: .5,
              subtasks: [
                strings.prepare_meeting_1,
                strings.prepare_meeting_2,
              ],
            ),
            AppGap.verticalMd,
            _TaskCard(
              title: strings.camp_inventory,
              progress: 0,
              subtasks: [
                strings.camp_inventory_1,
                strings.camp_inventory_2,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskCard extends StatefulWidget {
  const _TaskCard({
    required this.title,
    required this.progress,
    required this.subtasks,
  });

  final String title;
  final double progress;
  final List<String> subtasks;

  @override
  State<_TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<_TaskCard> {
  late final List<bool> _completed = List<bool>.generate(
    widget.subtasks.length,
    (index) => index < (widget.progress * widget.subtasks.length).round(),
  );

  @override
  Widget build(BuildContext context) {
    final done = _completed.where((value) => value).length;
    final progress = widget.subtasks.isEmpty ? 0.0 : done / widget.subtasks.length;

    return Card(
      child: Padding(
        padding: AppSpacing.card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.title(widget.title),
            AppGap.verticalMd,
            LinearProgressIndicator(value: progress),
            AppGap.verticalSm,
            for (var index = 0; index < widget.subtasks.length; index++)
              CheckboxListTile(
                value: _completed[index],
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: AppText.body(widget.subtasks[index]),
                onChanged: (value) {
                  setState(() => _completed[index] = value ?? false);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _CalendarTab extends StatelessWidget {
  const _CalendarTab();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.calendar;
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month);
    final days = DateUtils.getDaysInMonth(now.year, now.month);
    final leading = firstDay.weekday % 7;

    return AppPermissionGate(
      permission: AppPermission.eventsView,
      fallback: SafeArea(
        child: _AccessMessage(message: strings.access_denied),
      ),
      child: SafeArea(
        child: ListView(
          padding: AppSpacing.pageWithBottom,
          children: [
            AppPageHeader(title: strings.title, subtitle: strings.subtitle),
            AppGap.verticalLg,
            Card(
              child: Padding(
                padding: AppSpacing.cardSmall,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: AppSpacing.xs,
                    crossAxisSpacing: AppSpacing.xs,
                  ),
                  itemCount: leading + days,
                  itemBuilder: (context, index) {
                    if (index < leading) {
                      return const SizedBox.shrink();
                    }

                    final day = index - leading + 1;
                    final hasEvent = day == 7 || day == 14 || day == 22;

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: hasEvent
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .surfaceContainerLow,
                        borderRadius: AppRadius.small,
                      ),
                      child: Center(child: AppText.body('$day')),
                    );
                  },
                ),
              ),
            ),
            AppGap.verticalLg,
            _EventListTile(
              icon: Icons.groups_rounded,
              title: strings.meeting,
              day: '7',
            ),
            _EventListTile(
              icon: Icons.school_rounded,
              title: strings.training,
              day: '14',
            ),
            _EventListTile(
              icon: Icons.cabin_rounded,
              title: strings.camp,
              day: '22',
            ),
          ],
        ),
      ),
    );
  }
}

class _EventListTile extends StatelessWidget {
  const _EventListTile({
    required this.icon,
    required this.title,
    required this.day,
  });

  final IconData icon;
  final String title;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: AppText.body(title),
        trailing: AppText.title(day),
      ),
    );
  }
}

class _MoreTab extends StatelessWidget {
  const _MoreTab();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.more;

    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, sessionState) {
        final items = _visibleItems(context, sessionState);

        return SafeArea(
          child: ListView(
            padding: AppSpacing.pageWithBottom,
            children: [
              AppPageHeader(title: strings.title),
              AppGap.verticalLg,
              for (final item in items)
                Card(
                  child: ListTile(
                    leading: Icon(item.icon),
                    title: AppText.body(item.label),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: item.onTap,
                  ),
                ),
              AppGap.verticalSm,
              AppButton.outline(
                label: strings.logout,
                icon: const Icon(Icons.logout_rounded),
                isLoading: sessionState.isLoading,
                onPressed: sessionState.isLoading
                    ? null
                    : () => _logout(context),
              ),
            ],
          ),
        );
      },
    );
  }

  List<_MoreItem> _visibleItems(BuildContext context, SessionState state) {
    final strings = context.t.home.more;
    final user = state.user;

    final items = <_MoreItem>[
      _MoreItem(
        icon: Icons.person_outline_rounded,
        label: strings.profile,
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.notifications_outlined,
        label: strings.notifications,
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.language_rounded,
        label: strings.language,
        onTap: () => _switchLanguage(context),
      ),
      _MoreItem(
        icon: Icons.dark_mode_outlined,
        label: strings.theme,
        onTap: () => _switchTheme(context),
      ),
      _MoreItem(
        icon: Icons.description_outlined,
        label: strings.meeting_minutes,
        permissions: const [AppPermission.meetingsView],
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.swap_horiz_rounded,
        label: strings.incoming_outgoing,
        permissions: const [AppPermission.correspondenceView],
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.inventory_2_outlined,
        label: strings.inventory,
        permissions: const [AppPermission.inventoryView],
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.event_note_outlined,
        label: strings.activities,
        permissions: const [AppPermission.eventsView],
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.cabin_outlined,
        label: strings.camps,
        permissions: const [AppPermission.campsView],
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.support_agent_rounded,
        label: strings.support,
        onTap: () => _showComingSoon(context),
      ),
      _MoreItem(
        icon: Icons.help_outline_rounded,
        label: strings.help,
        onTap: () => _showComingSoon(context),
      ),
    ];

    return items.where((item) {
      if (item.permissions.isEmpty) {
        return true;
      }

      return user?.hasAnyPermission(item.permissions) ?? false;
    }).toList(growable: false);
  }

  Future<void> _logout(BuildContext context) async {
    await context.read<SessionCubit>().logout();

    if (!context.mounted) {
      return;
    }

    if (!context.read<SessionCubit>().state.isAuthenticated) {
      await context.router.replaceAll([const LoginRoute()]);
    }
  }

  Future<void> _switchLanguage(BuildContext context) async {
    final next = LocaleSettings.currentLocale == AppLocale.en
        ? AppLocale.ar
        : AppLocale.en;

    await LocaleSettings.setLocale(next);

    if (!context.mounted) {
      return;
    }

    context.read<ApplicationStartCubit>().updateLocale(next.languageCode);
  }

  void _switchTheme(BuildContext context) {
    final mode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    context.read<ApplicationStartCubit>().updateThemeMode(mode);
  }
}

class _MoreItem {
  const _MoreItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.permissions = const [],
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final List<AppPermission> permissions;
}

class _AccessMessage extends StatelessWidget {
  const _AccessMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.page,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_outline_rounded, size: AppSize.iconXl),
            AppGap.verticalMd,
            AppText.paragraph(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

void _showComingSoon(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(context.t.home.common.coming_soon)),
    );
}
