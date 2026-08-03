import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/people/application/member_edit/member_edit_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MemberDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  const MemberDetailsPage({required this.person, super.key});

  final Person person;

  @override
  State<MemberDetailsPage> createState() => _MemberDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MemberEditCubit>(),
      child: this,
    );
  }
}

class _MemberDetailsPageState extends State<MemberDetailsPage> {
  late Person _member;
  bool _changed = false;

  @override
  void initState() {
    super.initState();
    _member = widget.person;
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) context.router.pop(_changed);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(strings.details)),
        body: ListView(
          padding: AppSpacing.pageWithBottom,
          children: [
            Center(
              child: CircleAvatar(
                radius: 44,
                child: Text(
                  _member.fullName.characters.first,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            AppGap.verticalMd,
            AppText.heading(
              _member.fullName,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
            ),
            AppText.paragraph(
              '${_member.unit} · ${_member.membershipNumber}',
              textAlign: TextAlign.center,
            ),
            AppGap.verticalLg,
            _Section(
              title: strings.personal_information,
              onEdit: () => _openPersonalEditor(context),
              children: [
                _InfoRow(label: strings.full_name, value: _member.fullName),
                _InfoRow(label: strings.phone, value: _member.phone),
                _InfoRow(label: strings.email, value: _member.email),
                _InfoRow(label: strings.address, value: _member.address),
                _InfoRow(
                  label: strings.emergency_contact,
                  value: _member.emergencyContact,
                ),
              ],
            ),
            _Section(
              title: strings.scout_information,
              onEdit: () => _openScoutEditor(context),
              children: [
                _InfoRow(
                  label: strings.membership_number,
                  value: _member.membershipNumber,
                ),
                _InfoRow(label: strings.stage, value: _member.stage.name),
                _InfoRow(label: strings.unit, value: _member.unit),
                _InfoRow(label: strings.status, value: _member.status.name),
                _InfoRow(
                  label: strings.joined_at,
                  value: _member.joinedAt.toIso8601String().split('T').first,
                ),
              ],
            ),
            _Section(
              title: strings.notes,
              onEdit: () => _openNotesEditor(context),
              children: [
                AppText.paragraph(_member.notes.isEmpty ? '—' : _member.notes),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPersonalEditor(BuildContext context) async {
    final name = TextEditingController(text: _member.fullName);
    final phone = TextEditingController(text: _member.phone);
    final email = TextEditingController(text: _member.email);
    final address = TextEditingController(text: _member.address);
    final emergency = TextEditingController(text: _member.emergencyContact);

    await _showEditor(
      context,
      title: context.t.people.personal_information,
      fields: [
        TextFormField(
          controller: name,
          decoration: InputDecoration(labelText: context.t.people.full_name),
        ),
        TextFormField(
          controller: phone,
          decoration: InputDecoration(labelText: context.t.people.phone),
        ),
        TextFormField(
          controller: email,
          decoration: InputDecoration(labelText: context.t.people.email),
        ),
        TextFormField(
          controller: address,
          decoration: InputDecoration(labelText: context.t.people.address),
        ),
        TextFormField(
          controller: emergency,
          decoration: InputDecoration(
            labelText: context.t.people.emergency_contact,
          ),
        ),
      ],
      onSave: () => context.read<MemberEditCubit>().updatePersonal(
        member: _member,
        fullName: name.text,
        phone: phone.text,
        email: email.text,
        address: address.text,
        emergencyContact: emergency.text,
      ),
    );
  }

  Future<void> _openScoutEditor(BuildContext context) async {
    final membership = TextEditingController(text: _member.membershipNumber);
    final unit = TextEditingController(text: _member.unit);
    var stage = _member.stage;
    var status = _member.status;

    await _showEditor(
      context,
      title: context.t.people.scout_information,
      fields: [
        TextFormField(
          controller: membership,
          decoration: InputDecoration(
            labelText: context.t.people.membership_number,
          ),
        ),
        TextFormField(
          controller: unit,
          decoration: InputDecoration(labelText: context.t.people.unit),
        ),
        StatefulBuilder(
          builder: (context, setSheetState) => Column(
            children: [
              DropdownButtonFormField<ScoutStage>(
                initialValue: stage,
                decoration: InputDecoration(labelText: context.t.people.stage),
                items: ScoutStage.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) =>
                    setSheetState(() => stage = value ?? stage),
              ),
              AppGap.verticalSm,
              DropdownButtonFormField<PersonStatus>(
                initialValue: status,
                decoration: InputDecoration(labelText: context.t.people.status),
                items: PersonStatus.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) =>
                    setSheetState(() => status = value ?? status),
              ),
            ],
          ),
        ),
      ],
      onSave: () => context.read<MemberEditCubit>().updateScout(
        member: _member,
        membershipNumber: membership.text,
        unit: unit.text,
        stage: stage,
        status: status,
      ),
    );
  }

  Future<void> _openNotesEditor(BuildContext context) async {
    final notes = TextEditingController(text: _member.notes);
    await _showEditor(
      context,
      title: context.t.people.notes,
      fields: [
        TextFormField(
          controller: notes,
          maxLines: 8,
          decoration: InputDecoration(labelText: context.t.people.notes),
        ),
      ],
      onSave: () => context.read<MemberEditCubit>().updateNotes(
        member: _member,
        notes: notes.text,
      ),
    );
  }

  Future<void> _showEditor(
    BuildContext context, {
    required String title,
    required List<Widget> fields,
    required Future<void> Function() onSave,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetContext) {
        return BlocProvider.value(
          value: context.read<MemberEditCubit>(),
          child: BlocConsumer<MemberEditCubit, MemberEditState>(
            listener: (context, state) {
              final updated = state.updatedMember;
              if (updated != null) {
                setState(() {
                  _member = updated;
                  _changed = true;
                });
                Navigator.of(sheetContext).pop();
              }
            },
            builder: (context, state) {
              return SizedBox.expand(
                child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: state.isSaving
                          ? null
                          : () => Navigator.of(sheetContext).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                    title: Text(title),
                    actions: [
                      TextButton(
                        onPressed: state.isSaving ? null : onSave,
                        child: state.isSaving
                            ? const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(context.t.people.save),
                      ),
                    ],
                  ),
                  body: ListView.separated(
                    padding: AppSpacing.pageWithBottom,
                    itemCount: fields.length,
                    separatorBuilder: (_, _) => AppGap.verticalSm,
                    itemBuilder: (_, index) => fields[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.children,
    required this.onEdit,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppText.title(title, fontWeight: FontWeight.w800),
                ),
                IconButton(
                  tooltip: context.t.people.edit,
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined),
                ),
              ],
            ),
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
          Expanded(flex: 2, child: AppText.body(value.isEmpty ? '—' : value)),
        ],
      ),
    );
  }
}
