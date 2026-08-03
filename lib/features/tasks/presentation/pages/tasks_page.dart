import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/tasks/presentation/widgets/task_card.dart';

@RoutePage()
class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.tasks;

    return AppPermissionGate(
      permission: AppPermission.tasksView,
      fallback: AppAccessDenied(message: strings.access_denied),
      child: SafeArea(
        child: ListView(
          padding: AppSpacing.pageWithBottom,
          children: [
            AppPageHeader(
              title: strings.title,
              subtitle: strings.subtitle,
            ),
            AppGap.verticalLg,
            TaskCard(
              title: strings.prepare_meeting,
              initialProgress: .5,
              subtasks: [
                strings.prepare_meeting_1,
                strings.prepare_meeting_2,
              ],
            ),
            AppGap.verticalMd,
            TaskCard(
              title: strings.camp_inventory,
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
