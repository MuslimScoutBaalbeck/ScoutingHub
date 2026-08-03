import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MemberFormPage extends StatefulWidget {
  const MemberFormPage({super.key, this.person});

  final Person? person;

  @override
  State<MemberFormPage> createState() => _MemberFormPageState();
}

class _MemberFormPageState extends State<MemberFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _address;
  late final TextEditingController _membership;
  late final TextEditingController _unit;
  late final TextEditingController _emergency;
  late final TextEditingController _notes;
  late ScoutStage _stage;
  late PersonStatus _status;
  int _step = 0;

  @override
  void initState() {
    super.initState();
    final person = widget.person;
    _name = TextEditingController(text: person?.fullName);
    _phone = TextEditingController(text: person?.phone);
    _email = TextEditingController(text: person?.email);
    _address = TextEditingController(text: person?.address);
    _membership = TextEditingController(text: person?.membershipNumber);
    _unit = TextEditingController(text: person?.unit);
    _emergency = TextEditingController(text: person?.emergencyContact);
    _notes = TextEditingController(text: person?.notes);
    _stage = person?.stage ?? ScoutStage.scout;
    _status = person?.status ?? PersonStatus.pending;
  }

  @override
  void dispose() {
    for (final controller in [
      _name,
      _phone,
      _email,
      _address,
      _membership,
      _unit,
      _emergency,
      _notes,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.people;

    return Scaffold(
      appBar: AppBar(title: Text(widget.person == null ? strings.add : strings.edit)),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _step,
          onStepTapped: (value) => setState(() => _step = value),
          onStepCancel: _step == 0 ? null : () => setState(() => _step--),
          onStepContinue: _continue,
          controlsBuilder: (context, details) => Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: Row(
              children: [
                FilledButton(
                  onPressed: details.onStepContinue,
                  child: Text(_step == 3 ? strings.save : strings.next),
                ),
                if (_step > 0) ...[
                  const SizedBox(width: AppSpacing.sm),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Text(strings.back),
                  ),
                ],
              ],
            ),
          ),
          steps: [
            Step(
              title: Text(strings.personal_information),
              isActive: _step >= 0,
              content: Column(
                children: [
                  _requiredField(_name, strings.full_name),
                  const SizedBox(height: AppSpacing.sm),
                  _requiredField(_phone, strings.phone, keyboard: TextInputType.phone),
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: strings.email),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: _address,
                    decoration: InputDecoration(labelText: strings.address),
                  ),
                ],
              ),
            ),
            Step(
              title: Text(strings.contact_information),
              isActive: _step >= 1,
              content: TextFormField(
                controller: _emergency,
                decoration: InputDecoration(labelText: strings.emergency_contact),
              ),
            ),
            Step(
              title: Text(strings.scout_information),
              isActive: _step >= 2,
              content: Column(
                children: [
                  _requiredField(_membership, strings.membership_number),
                  const SizedBox(height: AppSpacing.sm),
                  _requiredField(_unit, strings.unit),
                  const SizedBox(height: AppSpacing.sm),
                  DropdownButtonFormField<ScoutStage>(
                    initialValue: _stage,
                    decoration: InputDecoration(labelText: strings.stage),
                    items: ScoutStage.values
                        .map((value) => DropdownMenuItem(value: value, child: Text(value.name)))
                        .toList(),
                    onChanged: (value) => setState(() => _stage = value ?? _stage),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  DropdownButtonFormField<PersonStatus>(
                    initialValue: _status,
                    decoration: InputDecoration(labelText: strings.status),
                    items: PersonStatus.values
                        .map((value) => DropdownMenuItem(value: value, child: Text(value.name)))
                        .toList(),
                    onChanged: (value) => setState(() => _status = value ?? _status),
                  ),
                ],
              ),
            ),
            Step(
              title: Text(strings.review),
              isActive: _step >= 3,
              content: TextFormField(
                controller: _notes,
                maxLines: 4,
                decoration: InputDecoration(labelText: strings.notes),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _requiredField(
    TextEditingController controller,
    String label, {
    TextInputType? keyboard,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(labelText: label),
      validator: (value) => value == null || value.trim().isEmpty ? label : null,
    );
  }

  void _continue() {
    if (_step < 3) {
      setState(() => _step++);
      return;
    }

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.t.people.saved)),
    );
    context.router.maybePop();
  }
}
