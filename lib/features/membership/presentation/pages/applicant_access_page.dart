import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/membership/application/applicant_access/applicant_access_cubit.dart';
import 'package:scouting_hub/features/membership/application/request_wizard/membership_request_wizard_cubit.dart';

@RoutePage()
class ApplicantAccessPage extends StatelessWidget implements AutoRouteWrapper {
  const ApplicantAccessPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: getIt<ApplicantAccessCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<SessionCubit>().state.user;
    final email = user?.email ?? '';
    final cubit = context.read<ApplicantAccessCubit>();

    if (email.isNotEmpty && cubit.state.email != email) {
      cubit.startSession(email: email);
    }

    return BlocConsumer<ApplicantAccessCubit, ApplicantAccessState>(
      listenWhen: (previous, current) =>
          previous.requestStatus != current.requestStatus ||
          previous.destination != current.destination,
      listener: (context, state) async {
        if (state.requestStatus == ApplicantRequestStatus.approved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your membership request has been approved.'),
            ),
          );
        }

        if (state.destination == ApplicantDestination.home) {
          await context.router.replaceAll([const HomeRoute()]);
        }
      },
      builder: (context, state) {
        return switch (state.destination) {
          ApplicantDestination.verifyEmail => _VerifyEmailView(
              email: email,
              onVerified: cubit.markEmailVerified,
            ),
          ApplicantDestination.membershipRequest => _MembershipRequestWizard(
              name: user?.name ?? '',
              email: email,
              onSubmitted: cubit.submitMembershipRequest,
            ),
          ApplicantDestination.requestStatus => _RequestStatusView(
              state: state,
              onDebugApprove: kDebugMode
                  ? () => cubit.updateRequestStatus(
                        ApplicantRequestStatus.approved,
                      )
                  : null,
            ),
          ApplicantDestination.home => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
        };
      },
    );
  }
}

class _VerifyEmailView extends StatelessWidget {
  const _VerifyEmailView({required this.email, required this.onVerified});

  final String email;
  final VoidCallback onVerified;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.page,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mark_email_unread_outlined,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
              AppGap.verticalLg,
              AppText.heading(
                'Verify your email',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w800,
              ),
              AppGap.verticalSm,
              AppText.paragraph(
                'We sent a verification link to $email. You cannot open the home page before verification.',
                textAlign: TextAlign.center,
              ),
              AppGap.verticalXl,
              AppButton.filled(
                label: 'I verified my email',
                onPressed: onVerified,
              ),
              AppGap.verticalSm,
              AppButton.outline(
                label: 'Resend verification email',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Verification email sent.')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MembershipRequestWizard extends StatelessWidget {
  const _MembershipRequestWizard({
    required this.name,
    required this.email,
    required this.onSubmitted,
  });

  final String name;
  final String email;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MembershipRequestWizardCubit>()..load(),
      child: _MembershipRequestWizardBody(
        name: name,
        email: email,
        onSubmitted: onSubmitted,
      ),
    );
  }
}

class _MembershipRequestWizardBody extends StatefulWidget {
  const _MembershipRequestWizardBody({
    required this.name,
    required this.email,
    required this.onSubmitted,
  });

  final String name;
  final String email;
  final ValueChanged<String> onSubmitted;

  @override
  State<_MembershipRequestWizardBody> createState() =>
      _MembershipRequestWizardBodyState();
}

class _MembershipRequestWizardBodyState
    extends State<_MembershipRequestWizardBody> {
  final _personalFormKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _notes = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MembershipRequestWizardCubit,
        MembershipRequestWizardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Membership request'),
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    LinearProgressIndicator(
                      value: (state.currentStep + 1) / (state.lastStep + 1),
                    ),
                    Expanded(
                      child: IndexedStack(
                        index: state.currentStep,
                        children: [
                          _personalStep(),
                          _locationStep(state),
                          _troopStep(state),
                          _reviewStep(state),
                        ],
                      ),
                    ),
                    _WizardControls(
                      canGoBack: state.currentStep > 0,
                      isLastStep: state.currentStep == state.lastStep,
                      onBack: context
                          .read<MembershipRequestWizardCubit>()
                          .previousStep,
                      onNext: () => _next(state),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _personalStep() {
    return Form(
      key: _personalFormKey,
      child: ListView(
        padding: AppSpacing.page,
        children: [
          AppText.heading('Personal information', fontWeight: FontWeight.w800),
          AppGap.verticalLg,
          _requiredField(_name, 'Full name'),
          AppGap.verticalSm,
          TextFormField(
            initialValue: widget.email,
            enabled: false,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          AppGap.verticalSm,
          _requiredField(_phone, 'Phone', keyboardType: TextInputType.phone),
          AppGap.verticalSm,
          _requiredField(_address, 'Detailed address'),
          AppGap.verticalSm,
          TextFormField(
            controller: _notes,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Notes'),
          ),
        ],
      ),
    );
  }

  Widget _locationStep(MembershipRequestWizardState state) {
    final cubit = context.read<MembershipRequestWizardCubit>();
    return ListView(
      padding: AppSpacing.page,
      children: [
        AppText.heading('Your location', fontWeight: FontWeight.w800),
        AppGap.verticalLg,
        DropdownButtonFormField<int>(
          initialValue: state.governorateId,
          decoration: const InputDecoration(labelText: 'Governorate'),
          items: state.data?.governorates
              .map(
                (item) => DropdownMenuItem(
                  value: item.id,
                  child: Text(item.name),
                ),
              )
              .toList(growable: false),
          onChanged: cubit.selectGovernorate,
        ),
        AppGap.verticalSm,
        DropdownButtonFormField<int>(
          initialValue: state.districtId,
          decoration: const InputDecoration(labelText: 'District'),
          items: state.availableDistricts
              .map(
                (item) => DropdownMenuItem(
                  value: item.id,
                  child: Text(item.name),
                ),
              )
              .toList(growable: false),
          onChanged: state.governorateId == null ? null : cubit.selectDistrict,
        ),
        AppGap.verticalSm,
        DropdownButtonFormField<int>(
          initialValue: state.cadasterId,
          decoration: const InputDecoration(labelText: 'Cadaster / town'),
          items: state.availableCadasters
              .map(
                (item) => DropdownMenuItem(
                  value: item.id,
                  child: Text(item.name),
                ),
              )
              .toList(growable: false),
          onChanged: state.districtId == null ? null : cubit.selectCadaster,
        ),
      ],
    );
  }

  Widget _troopStep(MembershipRequestWizardState state) {
    final cubit = context.read<MembershipRequestWizardCubit>();
    return ListView(
      padding: AppSpacing.page,
      children: [
        AppText.heading('Choose a troop', fontWeight: FontWeight.w800),
        AppGap.verticalLg,
        if (state.sendsToCommission)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  Icon(
                    Icons.location_off_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  AppGap.verticalSm,
                  AppText.title(
                    'No troop is currently available in this area',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w800,
                  ),
                  AppGap.verticalSm,
                  AppText.paragraph(
                    'Your request will be sent to ${state.selectedCadaster?.commissionName ?? 'the responsible commission'}. They may contact you when a nearby troop becomes available or when there is enough interest to establish a new troop.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          for (final troop in state.availableTroops)
            Card(
              child: RadioListTile<int>(
                value: troop.id,
                groupValue: state.troopId,
                onChanged: cubit.selectTroop,
                title: Text(troop.name),
                subtitle: Text(troop.address),
              ),
            ),
      ],
    );
  }

  Widget _reviewStep(MembershipRequestWizardState state) {
    return ListView(
      padding: AppSpacing.page,
      children: [
        AppText.heading('Review request', fontWeight: FontWeight.w800),
        AppGap.verticalLg,
        _ReviewRow(label: 'Name', value: _name.text),
        _ReviewRow(label: 'Email', value: widget.email),
        _ReviewRow(label: 'Phone', value: _phone.text),
        _ReviewRow(label: 'Address', value: _address.text),
        _ReviewRow(
          label: 'Destination',
          value: state.selectedTroop?.name ??
              state.selectedCadaster?.commissionName ??
              '—',
        ),
        if (state.sendsToCommission)
          const Padding(
            padding: EdgeInsets.only(top: AppSpacing.md),
            child: Text(
              'This is an interest request and will be reviewed by the commission.',
            ),
          ),
      ],
    );
  }

  TextFormField _requiredField(
    TextEditingController controller,
    String label, {
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      validator: (value) =>
          value == null || value.trim().isEmpty ? 'Required' : null,
    );
  }

  void _next(MembershipRequestWizardState state) {
    if (state.currentStep == 0 &&
        !(_personalFormKey.currentState?.validate() ?? false)) {
      return;
    }

    if (state.currentStep == 1 && state.cadasterId == null) {
      _showMessage('Select governorate, district, and cadaster.');
      return;
    }

    if (state.currentStep == 2 &&
        !state.sendsToCommission &&
        state.troopId == null) {
      _showMessage('Select a troop.');
      return;
    }

    if (state.currentStep == state.lastStep) {
      widget.onSubmitted('REQ-${DateTime.now().millisecondsSinceEpoch}');
      return;
    }

    context.read<MembershipRequestWizardCubit>().nextStep();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _WizardControls extends StatelessWidget {
  const _WizardControls({
    required this.canGoBack,
    required this.isLastStep,
    required this.onBack,
    required this.onNext,
  });

  final bool canGoBack;
  final bool isLastStep;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: AppSpacing.page,
        child: Row(
          children: [
            if (canGoBack) ...[
              Expanded(
                child: OutlinedButton(
                  onPressed: onBack,
                  child: const Text('Back'),
                ),
              ),
              AppGap.horizontalSm,
            ],
            Expanded(
              child: FilledButton(
                onPressed: onNext,
                child: Text(isLastStep ? 'Submit request' : 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(value.isEmpty ? '—' : value),
    );
  }
}

class _RequestStatusView extends StatelessWidget {
  const _RequestStatusView({required this.state, this.onDebugApprove});

  final ApplicantAccessState state;
  final VoidCallback? onDebugApprove;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Request status'),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.page,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.pending_actions_rounded,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
              AppGap.verticalLg,
              AppText.heading(
                'Your request is under review',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w800,
              ),
              AppGap.verticalSm,
              AppText.paragraph(
                'Request number: ${state.requestId ?? '—'}',
                textAlign: TextAlign.center,
              ),
              AppGap.verticalSm,
              AppText.paragraph(
                'You will receive a notification when the request is approved.',
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              if (onDebugApprove != null)
                AppButton.outline(
                  label: 'Debug: approve request',
                  onPressed: onDebugApprove,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
