import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/features/people/application/member_form/member_form_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MemberFormPage extends StatefulWidget implements AutoRouteWrapper {
  const MemberFormPage({super.key, this.person});

  final Person? person;

  @override
  State<MemberFormPage> createState() => _MemberFormPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MemberFormCubit>()..initialize(person),
      child: this,
    );
  }
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

  @override
  void initState() {
    super.initState();
    final member = widget.person;
    _name = TextEditingController(text: member?.fullName);
    _phone = TextEditingController(text: member?.phone);
    _email = TextEditingController(text: member?.email);
    _address = TextEditingController(text: member?.address);
    _membership = TextEditingController(text: member?.membershipNumber);
    _unit = TextEditingController(text: member?.unit);
    _emergency = TextEditingController(text: member?.emergencyContact);
    _notes = TextEditingController(text: member?.notes);
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

    return BlocConsumer<MemberFormCubit, MemberFormState>(
      listenWhen: (previous, current) =>
          previous.isSaved != current.isSaved || previous.error != current.error,
      listener: (context, state) {
        if (state.isSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(strings.saved)),
          );
          context.router.pop(true);
          return;
        }

        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(strings.unexpected_error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.person == null ? strings.add : strings.edit),
          ),
          body: Form(
            key: _formKey,
            child: Stepper(
              currentStep: state.currentStep,
              onStepTapped: state.isSaving
                  ? null
                  : context.read<MemberFormCubit>().goToStep,
              onStepCancel: state.canGoBack
                  ? context.read<MemberFormCubit>().previousStep
                  : null,
              onStepContinue: state.isSaving ? null : () => _continue(state),
              controlsBuilder: (context, details) => Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: details.onStepContinue,
                        child: state.isSaving
                            ? const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(
                                state.isLastStep ? strings.save : strings.next,
                              ),
                      ),
                    ),
                    if (state.canGoBack) ...[
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          child: Text(strings.back),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              steps: [
                Step(
                  title: Text(strings.personal_information),
                  isActive: state.currentStep >= 0,
                  content: Column(
                    children: [
                      _requiredField(_name, strings.full_name),
                      const SizedBox(height: AppSpacing.sm),
                      _requiredField(
                        _phone,
                        strings.phone,
                        keyboard: TextInputType.phone,
                      ),
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
                  isActive: state.currentStep >= 1,
                  content: TextFormField(
                    controller: _emergency,
                    decoration: InputDecoration(
                      labelText: strings.emergency_contact,
                    ),
                  ),
                ),
                Step(
                  title: Text(strings.scout_information),
                  isActive: state.currentStep >= 2,
                  content: Column(
                    children: [
                      _requiredField(_membership, strings.membership_number),
                      const SizedBox(height: AppSpacing.sm),
                      _requiredField(_unit, strings.unit),
                      const SizedBox(height: AppSpacing.sm),
                      DropdownButtonFormField<ScoutStage>(
                        value: state.stage,
                        decoration: InputDecoration(labelText: strings.stage),
                        items: ScoutStage.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name),
                              ),
                            )
                            .toList(growable: false),
                        onChanged: state.isSaving
                            ? null
                            : (value) {
                                if (value != null) {
                                  context
                                      .read<MemberFormCubit>()
                                      .changeStage(value);
                                }
                              },
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      DropdownButtonFormField<PersonStatus>(
                        value: state.status,
                        decoration: InputDecoration(labelText: strings.status),
                        items: PersonStatus.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name),
                              ),
                            )
                            .toList(growable: false),
                        onChanged: state.isSaving
                            ? null
                            : (value) {
                                if (value != null) {
                                  context
                                      .read<MemberFormCubit>()
                                      .changeStatus(value);
                                }
                              },
                      ),
                    ],
                  ),
                ),
                Step(
                  title: Text(strings.review),
                  isActive: state.currentStep >= 3,
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
      },
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

  Future<void> _continue(MemberFormState state) async {
    if (!state.isLastStep) {
      context.read<MemberFormCubit>().nextStep();
      return;
    }

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    await context.read<MemberFormCubit>().save(
      fullName: _name.text,
      phone: _phone.text,
      email: _email.text,
      address: _address.text,
      membershipNumber: _membership.text,
      unit: _unit.text,
      emergencyContact: _emergency.text,
      notes: _notes.text,
    );
  }
}
