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
        icon: Icons.sports_esports_rounded,
        label: strings.games,
        permissions: const [AppPermission.chantsView],
      ),
    ];
    final visibleItems = items
        .where((item) => user?.hasAnyPermission(item.permissions) ?? false)
        .toList(growable: false);

    if (visibleItems.isEmpty) {
      return AppText.paragraph(strings.no_modules);
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: visibleItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisExtent: 126,
      ),
      itemBuilder: (context, index) {
        final item = visibleItems[index];

        return QuickAccessTile(
          icon: item.icon,
          label: item.label,
          onPressed: onItemPressed,
        );
      },
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
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: InkWell(
        borderRadius: AppRadius.large,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: AppSize.iconSm,
                  color: colors.primary,
                ),
              ),
              AppGap.verticalSm,
              Flexible(
                child: AppText.caption(
                  label,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
