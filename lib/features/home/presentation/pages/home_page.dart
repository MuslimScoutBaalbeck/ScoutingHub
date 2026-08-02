import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/ui/atoms/app_square_action.dart';
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
    final pages = [
      const _DashboardTab(),
      const _TasksTab(),
      const _CalendarTab(),
      const _MoreTab(),
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            titleSpacing: 20,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(strings.welcome_back, style: theme.textTheme.titleSmall),
                Text(
                  strings.user_name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            actions: [
              AppSquareAction(
                tooltip: strings.notifications,
                onPressed: () => _showComingSoon(context),
                child: const Badge(child: Icon(Icons.notifications_outlined)),
              ),
              const SizedBox(width: 16),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            sliver: SliverList.list(
              children: [
                Card(
                  color: colors.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.event_available_rounded, color: colors.primary),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                strings.upcoming_title,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                strings.upcoming_name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(strings.upcoming_details),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  strings.quick_access,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: .95,
                  children: [
                    _QuickAccessTile(icon: Icons.event_rounded, label: strings.events),
                    _QuickAccessTile(icon: Icons.task_alt_rounded, label: strings.tasks),
                    _QuickAccessTile(icon: Icons.groups_rounded, label: strings.teams),
                    _QuickAccessTile(icon: Icons.people_alt_rounded, label: strings.members),
                    _QuickAccessTile(icon: Icons.music_note_rounded, label: strings.chants),
                    _QuickAccessTile(icon: Icons.sports_esports_rounded, label: strings.games),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showComingSoon(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: colors.primaryContainer,
                foregroundColor: colors.primary,
                child: Icon(icon),
              ),
              const SizedBox(height: 10),
              Text(label, textAlign: TextAlign.center, maxLines: 2),
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
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        children: [
          _PageHeading(title: strings.title, subtitle: strings.subtitle),
          const SizedBox(height: 20),
          _TaskCard(
            title: strings.prepare_meeting,
            progress: .5,
            subtasks: [strings.prepare_meeting_1, strings.prepare_meeting_2],
          ),
          const SizedBox(height: 14),
          _TaskCard(
            title: strings.camp_inventory,
            progress: 0,
            subtasks: [strings.camp_inventory_1, strings.camp_inventory_2],
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatefulWidget {
  const _TaskCard({required this.title, required this.progress, required this.subtasks});

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
    final progress = done / _completed.length;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 10),
            for (var index = 0; index < widget.subtasks.length; index++)
              CheckboxListTile(
                value: _completed[index],
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(widget.subtasks[index]),
                onChanged: (value) => setState(() => _completed[index] = value ?? false),
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

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        children: [
          _PageHeading(title: strings.title, subtitle: strings.subtitle),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: leading + days,
                itemBuilder: (context, index) {
                  if (index < leading) return const SizedBox.shrink();
                  final day = index - leading + 1;
                  final hasEvent = day == 7 || day == 14 || day == 22;
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: hasEvent
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('$day')),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18),
          _EventListTile(icon: Icons.groups_rounded, title: strings.meeting, day: '7'),
          _EventListTile(icon: Icons.school_rounded, title: strings.training, day: '14'),
          _EventListTile(icon: Icons.cabin_rounded, title: strings.camp, day: '22'),
        ],
      ),
    );
  }
}

class _EventListTile extends StatelessWidget {
  const _EventListTile({required this.icon, required this.title, required this.day});

  final IconData icon;
  final String title;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        trailing: Text(day, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class _MoreTab extends StatelessWidget {
  const _MoreTab();

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.more;
    final items = <({IconData icon, String label})>[
      (icon: Icons.person_outline_rounded, label: strings.profile),
      (icon: Icons.notifications_outlined, label: strings.notifications),
      (icon: Icons.language_rounded, label: strings.language),
      (icon: Icons.dark_mode_outlined, label: strings.theme),
      (icon: Icons.description_outlined, label: strings.meeting_minutes),
      (icon: Icons.swap_horiz_rounded, label: strings.incoming_outgoing),
      (icon: Icons.inventory_2_outlined, label: strings.inventory),
      (icon: Icons.event_note_outlined, label: strings.activities),
      (icon: Icons.cabin_outlined, label: strings.camps),
      (icon: Icons.support_agent_rounded, label: strings.support),
      (icon: Icons.help_outline_rounded, label: strings.help),
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        children: [
          _PageHeading(title: strings.title),
          const SizedBox(height: 18),
          for (final item in items)
            Card(
              child: ListTile(
                leading: Icon(item.icon),
                title: Text(item.label),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: item.label == strings.language
                    ? () => _switchLanguage(context)
                    : item.label == strings.theme
                        ? () => _switchTheme(context)
                        : () => _showComingSoon(context),
              ),
            ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _showComingSoon(context),
            icon: const Icon(Icons.logout_rounded),
            label: Text(strings.logout),
          ),
        ],
      ),
    );
  }

  Future<void> _switchLanguage(BuildContext context) async {
    final next = LocaleSettings.currentLocale == AppLocale.en ? AppLocale.ar : AppLocale.en;
    await LocaleSettings.setLocale(next);
    if (!context.mounted) return;
    context.read<ApplicationStartCubit>().updateLocale(next.languageCode);
  }

  void _switchTheme(BuildContext context) {
    final mode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    context.read<ApplicationStartCubit>().updateThemeMode(mode);
  }
}

class _PageHeading extends StatelessWidget {
  const _PageHeading({required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        if (subtitle case final subtitle?) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

void _showComingSoon(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(context.t.home.common.coming_soon)));
}
