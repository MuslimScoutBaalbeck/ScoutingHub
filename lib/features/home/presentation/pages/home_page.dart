import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final items = <_BottomNavigationItem>[
      _BottomNavigationItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _QuickCreateButton(
        onPressed: () => _showQuickCreateSheet(context),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: items.length,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: AppRadius.xl,
        rightCornerRadius: AppRadius.xl,
        backgroundColor: isDark ? colors.surface : Colors.white,
        shadow: BoxShadow(
          color: Colors.black.withValues(alpha: isDark ? .24 : .08),
          blurRadius: 24,
          offset: const Offset(0, -6),
        ),
        onTap: (index) {
          if (_currentIndex == index) {
            return;
          }

          setState(() => _currentIndex = index);
        },
        tabBuilder: (index, isActive) {
          final item = items[index];
          final foregroundColor = isActive
              ? colors.primary
              : colors.onSurfaceVariant;

          return Semantics(
            selected: isActive,
            button: true,
            label: item.label,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: AppSpacing.xs,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isActive ? item.selectedIcon : item.icon,
                    size: AppSize.iconMd,
                    color: foregroundColor,
                  ),
                  AppGap.verticalXxs,
                  Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: foregroundColor,
                      fontWeight: isActive
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showQuickCreateSheet(BuildContext context) async {
    final strings = context.t.home.create;
    final user = context.read<SessionCubit>().state.user;
    final actions = <_QuickCreateAction>[
      _QuickCreateAction(
        icon: Icons.task_alt_rounded,
        label: strings.task,
        permission: AppPermission.tasksCreate,
      ),
      _QuickCreateAction(
        icon: Icons.event_available_rounded,
        label: strings.event,
        permission: AppPermission.eventsManage,
      ),
      _QuickCreateAction(
        icon: Icons.person_add_alt_1_rounded,
        label: strings.member,
        permission: AppPermission.membersManage,
      ),
      _QuickCreateAction(
        icon: Icons.groups_2_outlined,
        label: strings.meeting,
        permission: AppPermission.meetingsManage,
      ),
      _QuickCreateAction(
        icon: Icons.inventory_2_outlined,
        label: strings.inventory,
        permission: AppPermission.inventoryManage,
      ),
      _QuickCreateAction(
        icon: Icons.mark_email_unread_outlined,
        label: strings.correspondence,
        permission: AppPermission.correspondenceManage,
      ),
    ];
    final visibleActions = actions
        .where((action) => user?.hasPermission(action.permission) ?? false)
        .toList(growable: false);

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (sheetContext) {
        return _QuickCreateSheet(
          title: strings.title,
          subtitle: strings.subtitle,
          emptyMessage: strings.no_actions,
          actions: visibleActions,
          onActionPressed: (action) {
            Navigator.of(sheetContext).pop();
            _showComingSoon(context);
          },
        );
      },
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

class _QuickCreateButton extends StatelessWidget {
  const _QuickCreateButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: context.t.home.create.tooltip,
      child: Material(
        color: colors.primary,
        elevation: 8,
        shadowColor: colors.primary.withValues(alpha: .35),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: 64,
            child: Icon(
              Icons.add_rounded,
              size: 32,
              color: colors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickCreateSheet extends StatelessWidget {
  const _QuickCreateSheet({
    required this.title,
    required this.subtitle,
    required this.emptyMessage,
    required this.actions,
    required this.onActionPressed,
  });

  final String title;
  final String subtitle;
  final String emptyMessage;
  final List<_QuickCreateAction> actions;
  final ValueChanged<_QuickCreateAction> onActionPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText.heading(title, fontWeight: FontWeight.w800),
          AppGap.verticalXxs,
          AppText.paragraph(
            subtitle,
            color: colors.onSurfaceVariant,
          ),
          AppGap.verticalLg,
          if (actions.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
              child: AppText.paragraph(
                emptyMessage,
                textAlign: TextAlign.center,
                color: colors.onSurfaceVariant,
              ),
            )
          else
            ...actions.map(
              (action) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: ListTile(
                  onTap: () => onActionPressed(action),
                  leading: Icon(action.icon, color: colors.primary),
                  title: AppText.body(
                    action.label,
                    fontWeight: FontWeight.w600,
                  ),
                  trailing: Icon(
                    Directionality.of(context) == TextDirection.rtl
                        ? Icons.chevron_left_rounded
                        : Icons.chevron_right_rounded,
                  ),
                  tileColor: colors.surfaceContainerLow,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.large,
                  ),
                ),
              ),
            ),
        ],
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

final class _QuickCreateAction {
  const _QuickCreateAction({
    required this.icon,
    required this.label,
    required this.permission,
  });

  final IconData icon;
  final String label;
  final AppPermission permission;
}
