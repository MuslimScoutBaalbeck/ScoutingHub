import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
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
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  context.t.membership.status.approved_notification,
                ),
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
    final strings = context.t.membership.verify_email;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.page,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height - 160,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.mark_email_unread_outlined,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
                AppGap.verticalLg,
                AppText.heading(
                  strings.title,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w800,
                ),
                AppGap.verticalSm,
                AppText.paragraph(
                  strings.description(email: email),
                  textAlign: TextAlign.center,
                ),
                AppGap.verticalXl,
                AppButton.filled(
                  label: strings.verified_action,
                  onPressed: onVerified,
                ),
                AppGap.verticalSm,
                AppButton.outline(
                  label: strings.resend_action,
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text(strings.resent)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MembershipRequestWizard extends StatelessWidget {
  const _MembershipRequestWizard({required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MembershipRequestWizardCubit>()..load(),
      child: _MembershipRequestWizardBody(name: name, email: email),
    );
  }
}

class _MembershipRequestWizardBody extends StatefulWidget {
  const _MembershipRequestWizardBody({required this.name, required this.email});

  final String name;
  final String email;

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
    final strings = context.t.membership.request;

    return BlocBuilder<MembershipRequestWizardCubit,
        MembershipRequestWizardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(strings.title),
                Text(
                  '${state.currentStep + 1}/${state.lastStep + 1}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.error != null
                  ? Center(
                      child: AppButton.filled(
                        label: context.t.people.retry,
                        onPressed: context
                            .read<MembershipRequestWizardCubit>()
                            .load,
                      ),
                    )
                  : Column(
                      children: [
                        LinearProgressIndicator(
                          value:
                              (state.currentStep + 1) / (state.lastStep + 1),
                        ),
                        Expanded(
                          child: IndexedStack(
                            index: state.currentStep,
                            children: [
                              _personalStep(strings),
                              _locationStep(state, strings),
                              _troopStep(state, strings),
                              _reviewStep(state, strings),
                            ],
                          ),
                        ),
                        _WizardControls(
                          canGoBack: state.currentStep > 0,
                          isLastStep: state.currentStep == state.lastStep,
                          backLabel: strings.back,
                          nextLabel: strings.next,
                          submitLabel: strings.submit,
                          onBack: context
                              .read<MembershipRequestWizardCubit>()
                              .previousStep,
                          onNext: () => _next(state, strings),
                        ),
                      ],
                    ),
        );
      },
    );
  }

  Widget _personalStep(dynamic strings) {
    return Form(
      key: _personalFormKey,
      child: ListView(
        padding: AppSpacing.page,
        children: [
          AppText.heading(
            strings.steps.personal,
            fontWeight: FontWeight.w800,
          ),
          AppGap.verticalSm,
          AppText.paragraph(strings.subtitle),
          AppGap.verticalLg,
          _requiredField(_name, strings.full_name, strings.required),
          AppGap.verticalSm,
          TextFormField(
            initialValue: widget.email,
            enabled: false,
            decoration: InputDecoration(labelText: strings.email),
          ),
          AppGap.verticalSm,
          _requiredField(
            _phone,
            strings.phone,
            strings.required,
            keyboardType: TextInputType.phone,
          ),
          AppGap.verticalSm,
          _requiredField(_address, strings.address, strings.required),
          AppGap.verticalSm,
          TextFormField(
            controller: _notes,
            maxLines: 3,
            decoration: InputDecoration(labelText: strings.notes),
          ),
        ],
      ),
    );
  }

  Widget _locationStep(
    MembershipRequestWizardState state,
    dynamic strings,
  ) {
    final cubit = context.read<MembershipRequestWizardCubit>();

    return ListView(
      padding: AppSpacing.page,
      children: [
        AppText.heading(
          strings.steps.location,
          fontWeight: FontWeight.w800,
        ),
        AppGap.verticalLg,
        DropdownButtonFormField<int>(
          initialValue: state.governorateId,
          decoration: InputDecoration(labelText: strings.governorate),
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
          decoration: InputDecoration(labelText: strings.district),
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
          decoration: InputDecoration(labelText: strings.cadaster),
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

  Widget _troopStep(
    MembershipRequestWizardState state,
    dynamic strings,
  ) {
    final cubit = context.read<MembershipRequestWizardCubit>();

    return ListView(
      padding: AppSpacing.page,
      children: [
        AppText.heading(strings.choose_troop, fontWeight: FontWeight.w800),
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
                    strings.no_troop_title,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w800,
                  ),
                  AppGap.verticalSm,
                  AppText.paragraph(
                    strings.no_troop_description(
                      commission: state.destinationName,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          for (final troop in state.availableTroops)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => cubit.selectTroop(troop.id),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Row(
                      children: [
                        Icon(
                          state.troopId == troop.id
                              ? Icons.radio_button_checked_rounded
                              : Icons.radio_button_off_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        AppGap.horizontalMd,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.body(
                                troop.name,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText.caption(troop.address),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }

  Widget _reviewStep(
    MembershipRequestWizardState state,
    dynamic strings,
  ) {
    final typeLabel = state.sendsToCommission
        ? strings.commission_interest
        : strings.troop_membership;

    return ListView(
      padding: AppSpacing.page,
      children: [
        AppText.heading(strings.review_title, fontWeight: FontWeight.w800),
        AppGap.verticalLg,
        _ReviewRow(label: strings.name, value: _name.text),
        _ReviewRow(label: strings.email, value: widget.email),
        _ReviewRow(label: strings.phone, value: _phone.text),
        _ReviewRow(label: strings.address, value: _address.text),
        _ReviewRow(
          label: strings.governorate,
          value: state.selectedGovernorate?.name ?? '—',
        ),
        _ReviewRow(
          label: strings.district,
          value: state.selectedDistrict?.name ?? '—',
        ),
        _ReviewRow(
          label: strings.cadaster,
          value: state.selectedCadaster?.name ?? '—',
        ),
        _ReviewRow(label: strings.request_type, value: typeLabel),
        _ReviewRow(
          label: strings.destination,
          value: state.destinationName,
        ),
        if (state.sendsToCommission)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: AppText.paragraph(strings.commission_notice),
          ),
      ],
    );
  }

  TextFormField _requiredField(
    TextEditingController controller,
    String label,
    String requiredMessage, {
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      validator: (value) => value == null || value.trim().isEmpty
          ? requiredMessage
          : null,
    );
  }

  void _next(MembershipRequestWizardState state, dynamic strings) {
    if (state.currentStep == 0 &&
        !(_personalFormKey.currentState?.validate() ?? false)) {
      return;
    }

    if (state.currentStep == 1 && state.cadasterId == null) {
      _showMessage(strings.select_location_error);
      return;
    }

    if (state.currentStep == 2 &&
        !state.sendsToCommission &&
        state.troopId == null) {
      _showMessage(strings.select_troop_error);
      return;
    }

    if (state.currentStep == state.lastStep) {
      context.read<ApplicantAccessCubit>().submitMembershipRequest(
            requestId: 'REQ-${DateTime.now().millisecondsSinceEpoch}',
            requestType: state.sendsToCommission
                ? ApplicantRequestType.commissionInterest
                : ApplicantRequestType.troopMembership,
            governorateId: state.governorateId,
            districtId: state.districtId,
            cadasterId: state.cadasterId,
            troopId: state.troopId,
            commissionId: state.commissionId,
            destinationName: state.destinationName,
          );
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
    required this.backLabel,
    required this.nextLabel,
    required this.submitLabel,
    required this.onBack,
    required this.onNext,
  });

  final bool canGoBack;
  final bool isLastStep;
  final String backLabel;
  final String nextLabel;
  final String submitLabel;
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
                  child: Text(backLabel),
                ),
              ),
              AppGap.horizontalSm,
            ],
            Expanded(
              child: FilledButton(
                onPressed: onNext,
                child: Text(isLastStep ? submitLabel : nextLabel),
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
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: AppText.caption(label),
      subtitle: AppText.body(value.isEmpty ? '—' : value),
    );
  }
}

class _RequestStatusView extends StatelessWidget {
  const _RequestStatusView({required this.state, this.onDebugApprove});

  final ApplicantAccessState state;
  final VoidCallback? onDebugApprove;

  @override
  Widget build(BuildContext context) {
    final strings = context.t.membership.status;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(strings.title),
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.page,
          children: [
            Icon(
              Icons.pending_actions_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            AppGap.verticalLg,
            AppText.heading(
              strings.under_review,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
            ),
            AppGap.verticalSm,
            AppText.paragraph(
              strings.request_number(number: state.requestId ?? '—'),
              textAlign: TextAlign.center,
            ),
            if ((state.destinationName ?? '').isNotEmpty) ...[
              AppGap.verticalSm,
              AppText.paragraph(
                strings.destination(
                  destination: state.destinationName ?? '—',
                ),
                textAlign: TextAlign.center,
              ),
            ],
            AppGap.verticalSm,
            AppText.paragraph(
              strings.notification_notice,
              textAlign: TextAlign.center,
            ),
            AppGap.verticalXl,
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    _StatusStep(
                      label: context.t.membership.request.submit,
                      complete: true,
                    ),
                    _StatusStep(
                      label: strings.under_review,
                      complete: state.requestStatus !=
                          ApplicantRequestStatus.submitted,
                    ),
                    _StatusStep(
                      label: strings.approved_notification,
                      complete: state.requestStatus ==
                          ApplicantRequestStatus.approved,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
            if (onDebugApprove != null) ...[
              AppGap.verticalXl,
              AppButton.outline(
                label: strings.debug_approve,
                onPressed: onDebugApprove,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusStep extends StatelessWidget {
  const _StatusStep({
    required this.label,
    required this.complete,
    this.isLast = false,
  });

  final String label;
  final bool complete;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              complete
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: complete ? colors.primary : colors.outline,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 36,
                color: complete ? colors.primary : colors.outlineVariant,
              ),
          ],
        ),
        AppGap.horizontalSm,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: AppText.body(label, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
