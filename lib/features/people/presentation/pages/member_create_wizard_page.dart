import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/features/people/application/member_create/member_create_cubit.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@RoutePage()
class MemberCreateWizardPage extends StatefulWidget
    implements AutoRouteWrapper {
  const MemberCreateWizardPage({super.key});

  @override
  State<MemberCreateWizardPage> createState() =>
      _MemberCreateWizardPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MemberCreateCubit>(),
      child: this,
    );
  }
}

class _MemberCreateWizardPageState extends State<MemberCreateWizardPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _membership = TextEditingController();
  final _unit = TextEditingController();
  final _emergency = TextEditingController();
  final _notes = TextEditingController();

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

    return BlocConsumer<MemberCreateCubit, MemberCreateState>(
      listenWhen: (previous, current) =>
          previous.isSaved != current.isSaved || previous.error != current.error,
      listener: (context, state) {
        if (state.isSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(strings.saved)),
          );
          context.router.pop(true);
        } else if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(strings.unexpected_error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(strings.add)),
          body: Form(
            key: _formKey,
            child: Stepper(
              currentStep: state.currentStep,
              onStepTapped: state.isSaving
                  ? null
                  : context.read<MemberCreateCubit>().goToStep,
              onStepCancel: state.currentStep == 0 || state.isSaving
                  ? null
                  : context.read<MemberCreateCubit>().previousStep,
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
                                state.currentStep == 3
                                    ? strings.save
                                    : strings.next,
                              ),
                      ),
                    ),
                    if (state.currentStep > 0) ...[
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
                        initialValue: state.stage,
                        decoration: InputDecoration(labelText: strings.stage),
                        items: ScoutStage.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name),
                              ),
                            )
                            .toList(),
                        onChanged: state.isSaving
                            ? null
                            : (value) {
                                if (value != null) {
                                  context
                                      .read<MemberCreateCubit>()
                                      .stageChanged(value);
                                }
                              },
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      DropdownButtonFormField<PersonStatus>(
                        initialValue: state.status,
                        decoration: InputDecoration(labelText: strings.status),
                        items: PersonStatus.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name),
                              ),
                            )
                            .toList(),
                        onChanged: state.isSaving
                            ? null
                            : (value) {
                                if (value != null) {
                                  context
                                      .read<MemberCreateCubit>()
                                      .statusChanged(value);
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

  void _continue(MemberCreateState state) {
    if (state.currentStep < 3) {
      context.read<MemberCreateCubit>().nextStep();
      return;
    }

    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.read<MemberCreateCubit>().create(
      fullName: _name.text,
      phone: _phone.text,
      email: _email.text,
      address: _address.text,
      emergencyContact: _emergency.text,
      membershipNumber: _membership.text,
      unit: _unit.text,
      notes: _notes.text,
    );
  }
}
