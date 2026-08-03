import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MemberDetailsPage extends StatelessWidget {
  const MemberDetailsPage({required this.person, super.key});

  final Person person;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.details),
        actions: [
          IconButton(
            tooltip: strings.edit,
            onPressed: () => context.router.push(
              MemberFormRoute(person: person),
            ),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.pageWithBottom,
        children: [
          Center(
            child: CircleAvatar(
              radius: 44,
              child: Text(
                person.fullName.characters.first,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          AppGap.verticalMd,
          AppText.heading(
            person.fullName,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w800,
          ),
          AppText.paragraph(
            '${person.unit} · ${person.membershipNumber}',
            textAlign: TextAlign.center,
          ),
          AppGap.verticalLg,
          _Section(
            title: strings.personal_information,
            children: [
              _InfoRow(label: strings.full_name, value: person.fullName),
              _InfoRow(label: strings.phone, value: person.phone),
              _InfoRow(label: strings.email, value: person.email),
              _InfoRow(label: strings.address, value: person.address),
              _InfoRow(
                label: strings.emergency_contact,
                value: person.emergencyContact,
              ),
            ],
          ),
          _Section(
            title: strings.scout_information,
            children: [
              _InfoRow(
                label: strings.membership_number,
                value: person.membershipNumber,
              ),
              _InfoRow(label: strings.stage, value: person.stage.name),
              _InfoRow(label: strings.unit, value: person.unit),
              _InfoRow(label: strings.status, value: person.status.name),
              _InfoRow(
                label: strings.joined_at,
                value: person.joinedAt.toIso8601String().split('T').first,
              ),
            ],
          ),
          if (person.notes.isNotEmpty)
            _Section(
              title: strings.notes,
              children: [AppText.paragraph(person.notes)],
            ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppText.title(title, fontWeight: FontWeight.w800),
            AppGap.verticalSm,
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: AppText.caption(label)),
          Expanded(
            flex: 2,
            child: AppText.body(value.isEmpty ? '—' : value),
          ),
        ],
      ),
    );
  }
}
