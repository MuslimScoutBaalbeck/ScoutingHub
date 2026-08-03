import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

class CalendarMonthView extends StatelessWidget {
  const CalendarMonthView({
    required this.month,
    required this.eventDays,
    super.key,
  });

  final DateTime month;
  final Set<int> eventDays;

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month);
    final days = DateUtils.getDaysInMonth(month.year, month.month);
    final leading = firstDay.weekday % 7;

    return Card(
      child: Padding(
        padding: AppSpacing.card,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            final colors = Theme.of(context).colorScheme;
            final hasEvent = eventDays.contains(day);

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
    );
  }
}
