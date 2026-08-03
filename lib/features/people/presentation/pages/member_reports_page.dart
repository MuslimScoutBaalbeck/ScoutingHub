import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

@RoutePage()
class MemberReportsPage extends StatelessWidget {
  const MemberReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;
    final reports = [
      (strings.report_by_stage, Icons.pie_chart_outline_rounded),
      (strings.report_incomplete, Icons.warning_amber_rounded),
      (strings.report_new_members, Icons.person_add_alt_1_rounded),
      (strings.report_contacts, Icons.contact_phone_outlined),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(strings.reports)),
      body: ListView.separated(
        padding: AppSpacing.pageWithBottom,
        itemCount: reports.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.xs),
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: Icon(
                report.$2,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: AppText.body(report.$1, fontWeight: FontWeight.w700),
              trailing: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_outlined),
                label: Text(strings.export),
              ),
            ),
          );
        },
      ),
    );
  }
}
