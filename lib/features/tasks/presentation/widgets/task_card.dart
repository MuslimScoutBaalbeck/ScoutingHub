import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    required this.title,
    required this.subtasks,
    super.key,
    this.initialProgress = 0,
  });

  final String title;
  final List<String> subtasks;
  final double initialProgress;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late final List<bool> _completed = List<bool>.generate(
    widget.subtasks.length,
    (index) =>
        index < (widget.initialProgress * widget.subtasks.length).round(),
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
