import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
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

    final items = <_BottomNavigationItem>[
      _BottomNavigationItem(
        icon: Icons.dashboard_outlined,
        selectedIcon: Icons.dashboard_rounded,
        label: strings.dashboard,
      ),
      _BottomNavigationItem(
        icon: Icons.task_alt_outlined,
        selectedIcon: Icons.task_alt_rounded,
        label: strings.tasks,
      ),
      _BottomNavigationItem(
        icon: Icons.calendar_month_outlined,
        selectedIcon: Icons.calendar_month_rounded,
        label: strings.calendar,
      ),
      _BottomNavigationItem(
        icon: Icons.grid_view_outlined,
        selectedIcon: Icons.grid_view_rounded,
        label: strings.more,
      ),
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _AppBottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onSelected: (index) {
          if (_currentIndex == index) {
            return;
          }

          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}

class _AppBottomNavigationBar extends StatelessWidget {
  const _AppBottomNavigationBar({
    required this.currentIndex,
    required this.items,
    required this.onSelected,
  });

  final int currentIndex;
  final List<_BottomNavigationItem> items;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor = isDark ? colors.surface : Colors.white;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadius.extraLargeValue),
          topRight: Radius.circular(AppRadius.extraLargeValue),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? .24 : .08),
            blurRadius: 24,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(
          top: AppSpacing.sm,
          bottom: AppSpacing.xs,
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];

            return Expanded(
              child: _BottomNavigationDestination(
                item: item,
                isSelected: currentIndex == index,
                onPressed: () => onSelected(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavigationDestination extends StatelessWidget {
  const _BottomNavigationDestination({
    required this.item,
    required this.isSelected,
    required this.onPressed,
  });

  final _BottomNavigationItem item;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final foregroundColor = isSelected
        ? colors.primary
        : colors.onSurfaceVariant;

    return Semantics(
      selected: isSelected,
      button: true,
      label: item.label,
      child: InkWell(
        onTap: onPressed,
        borderRadius: AppRadius.large,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: AppSpacing.xs,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? item.selectedIcon : item.icon,
                size: AppSize.iconMd,
                color: foregroundColor,
              ),
              AppGap.verticalXxs,
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foregroundColor,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _BottomNavigationItem {
  const _BottomNavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}
