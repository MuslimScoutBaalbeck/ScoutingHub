import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/scout_assignment.dart';

class AssignmentSwitcher extends StatelessWidget {
  const AssignmentSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;

    return BlocBuilder<SessionCubit, SessionState>(
      buildWhen: (previous, current) =>
          previous.assignments != current.assignments ||
          previous.activeAssignmentId != current.activeAssignmentId,
      builder: (context, state) {
        final assignments = state.assignments;

        if (assignments.isEmpty) {
          return Card(
            child: Padding(
              padding: AppSpacing.card,
              child: AppText.paragraph(strings.no_assignment),
            ),
          );
        }

        return DropdownButtonFormField<int>(
          initialValue: state.activeAssignmentId,
          decoration: InputDecoration(
            labelText: strings.active_assignment,
            prefixIcon: const Icon(Icons.badge_outlined),
          ),
          items: assignments
              .map(
                (assignment) => DropdownMenuItem<int>(
                  value: assignment.id,
                  child: Text(_label(assignment)),
                ),
              )
              .toList(growable: false),
          onChanged: assignments.length == 1
              ? null
              : (assignmentId) {
                  if (assignmentId != null) {
                    context.read<SessionCubit>().selectAssignment(assignmentId);
                  }
                },
        );
      },
    );
  }

  String _label(ScoutAssignment assignment) {
    return '${assignment.positionName} — ${assignment.unitName}';
  }
}
