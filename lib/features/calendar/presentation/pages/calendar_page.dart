import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/calendar/presentation/widgets/calendar_event_tile.dart';
import 'package:scouting_hub/features/calendar/presentation/widgets/calendar_month_view.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.calendar;

    return AppPermissionGate(
      permission: AppPermission.eventsView,
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
            CalendarMonthView(
              month: DateTime.now(),
              eventDays: const {7, 14, 22},
            ),
            AppGap.verticalLg,
            CalendarEventTile(
              icon: Icons.groups_rounded,
              title: strings.meeting,
              day: '7',
            ),
            CalendarEventTile(
              icon: Icons.school_rounded,
              title: strings.training,
              day: '14',
            ),
            CalendarEventTile(
              icon: Icons.cabin_rounded,
              title: strings.camp,
              day: '22',
            ),
          ],
        ),
      ),
    );
  }
}
