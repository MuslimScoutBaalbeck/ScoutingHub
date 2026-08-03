import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/features/calendar/presentation/pages/calendar_page.dart';
import 'package:scouting_hub/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:scouting_hub/features/more/presentation/pages/more_page.dart';
import 'package:scouting_hub/features/tasks/presentation/pages/tasks_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _pages = <Widget>[
    DashboardPage(),
    TasksPage(),
    CalendarPage(),
    MorePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.navigation;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard_rounded),
            label: strings.dashboard,
          ),
          NavigationDestination(
            icon: const Icon(Icons.task_alt_outlined),
            selectedIcon: const Icon(Icons.task_alt_rounded),
            label: strings.tasks,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            selectedIcon: const Icon(Icons.calendar_month_rounded),
            label: strings.calendar,
          ),
          NavigationDestination(
            icon: const Icon(Icons.grid_view_outlined),
            selectedIcon: const Icon(Icons.grid_view_rounded),
            label: strings.more,
          ),
        ],
      ),
    );
  }
}
