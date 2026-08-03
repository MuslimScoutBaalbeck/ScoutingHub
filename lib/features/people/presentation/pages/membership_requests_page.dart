import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';

@RoutePage()
class MembershipRequestsPage extends StatelessWidget {
  const MembershipRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;
    final requests = [
      ('أحمد علي', strings.request_new, Icons.fiber_new_rounded),
      ('محمد حسن', strings.request_review, Icons.manage_search_rounded),
      ('علي خليل', strings.request_needs_info, Icons.info_outline_rounded),
      ('حسين عباس', strings.request_approved, Icons.verified_outlined),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(strings.membership_requests)),
      body: ListView.separated(
        padding: AppSpacing.pageWithBottom,
        itemCount: requests.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.xs),
        itemBuilder: (context, index) {
          final request = requests[index];
          return Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: Icon(
                request.$3,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: AppText.body(request.$1, fontWeight: FontWeight.w700),
              subtitle: AppText.caption(request.$2),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
