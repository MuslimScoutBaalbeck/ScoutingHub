import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({required this.onItemPressed, super.key});

  final VoidCallback onItemPressed;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;
    final user = context.watch<SessionCubit>().state.user;
    final items = <QuickAccessItem>[
      QuickAccessItem(
        icon: Icons.event_rounded,
        label: strings.events,
        permissions: const [AppPermission.eventsView],
      ),
      QuickAccessItem(
        icon: Icons.task_alt_rounded,
        label: strings.tasks,
        permissions: const [AppPermission.tasksView],
      ),
      QuickAccessItem(
        icon: Icons.groups_rounded,
        label: strings.teams,
        permissions: const [AppPermission.teamsView],
      ),
      QuickAccessItem(
        icon: Icons.people_alt_rounded,
        label: strings.members,
        permissions: const [AppPermission.membersView],
      ),
      QuickAccessItem(
        icon: Icons.music_note_rounded,
        label: strings.chants,
        permissions: const [AppPermission.chantsView],
      ),
      QuickAccessItem(
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
            (item) => QuickAccessTile(
              icon: item.icon,
              label: item.label,
              onPressed: onItemPressed,
            ),
          )
          .toList(growable: false),
    );
  }
}

class QuickAccessTile extends StatelessWidget {
  const QuickAccessTile({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        borderRadius: AppRadius.large,
        onTap: onPressed,
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

final class QuickAccessItem {
  const QuickAccessItem({
    required this.icon,
    required this.label,
    required this.permissions,
  });

  final IconData icon;
  final String label;
  final List<AppPermission> permissions;
}
