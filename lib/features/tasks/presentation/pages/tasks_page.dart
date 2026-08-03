import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.tasks;

    return AppPermissionGate(
      permission: AppPermission.tasksView,
      fallback: _AccessDenied(message: strings.access_denied),
      child: SafeArea(
        child: ListView(
          padding: AppSpacing.pageWithBottom,
          children: [
            AppPageHeader(
              title: strings.title,
              subtitle: strings.subtitle,
            ),
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
    final completedCount = _completed.where((value) => value).length;
    final progress = _completed.isEmpty
        ? 0.0
        : completedCount / _completed.length;

    return Card(
      child: Padding(
        padding: AppSpacing.cardLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.title(widget.title, fontWeight: FontWeight.w700),
            AppGap.verticalMd,
            LinearProgressIndicator(value: progress),
            AppGap.verticalSm,
            for (var index = 0; index < widget.subtasks.length; index++)
              CheckboxListTile(
                value: _completed[index],
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: AppText.paragraph(widget.subtasks[index]),
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

class _AccessDenied extends StatelessWidget {
  const _AccessDenied({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: AppSpacing.page,
          child: AppText.paragraph(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
