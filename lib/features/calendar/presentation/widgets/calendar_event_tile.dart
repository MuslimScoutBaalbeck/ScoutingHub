import 'package:flutter/material.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

class CalendarEventTile extends StatelessWidget {
  const CalendarEventTile({
    required this.icon,
    required this.title,
    required this.day,
    super.key,
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
