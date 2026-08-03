import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.navigation;
    final colors = Theme.of(context).colorScheme;
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        TasksRoute(),
        CalendarRoute(),
        MoreRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          extendBody: true,
          body: child,
          floatingActionButton: FloatingActionButton(
            heroTag: 'home_quick_create',
            tooltip: context.t.home.create.tooltip,
            onPressed: () => _showQuickCreateSheet(context),
            child: const Icon(Icons.add_rounded),
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            elevation: 3,
            shadowColor: Colors.black,
            backgroundColor: colors.surface,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home_rounded),
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
      },
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
          AppText.paragraph(subtitle, color: colors.onSurfaceVariant),
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
