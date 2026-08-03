import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.calendar;
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month);
    final days = DateUtils.getDaysInMonth(now.year, now.month);
    final leading = firstDay.weekday % 7;

    return AppPermissionGate(
      permission: AppPermission.eventsView,
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
            Card(
              child: Padding(
                padding: AppSpacing.card,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: AppSpacing.xs,
                    crossAxisSpacing: AppSpacing.xs,
                  ),
                  itemCount: leading + days,
                  itemBuilder: (context, index) {
                    if (index < leading) {
                      return const SizedBox.shrink();
                    }

                    final day = index - leading + 1;
                    final hasEvent = day == 7 || day == 14 || day == 22;
                    final colors = Theme.of(context).colorScheme;

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: hasEvent
                            ? colors.primaryContainer
                            : colors.surfaceContainerLow,
                        borderRadius: AppRadius.small,
                      ),
                      child: Center(child: AppText.caption('$day')),
                    );
                  },
                ),
              ),
            ),
            AppGap.verticalLg,
            _EventListTile(
              icon: Icons.groups_rounded,
              title: strings.meeting,
              day: '7',
            ),
            _EventListTile(
              icon: Icons.school_rounded,
              title: strings.training,
              day: '14',
            ),
            _EventListTile(
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

class _EventListTile extends StatelessWidget {
  const _EventListTile({
    required this.icon,
    required this.title,
    required this.day,
  });

  final IconData icon;
  final String title;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: AppText.paragraph(title),
        trailing: AppText.title(day),
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
