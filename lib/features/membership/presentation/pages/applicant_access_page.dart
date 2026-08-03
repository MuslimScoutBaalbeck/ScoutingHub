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
          ApplicantDestination.membershipRequest => _MembershipRequestView(
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

class _MembershipRequestView extends StatefulWidget {
  const _MembershipRequestView({
    required this.name,
    required this.email,
    required this.onSubmitted,
  });

  final String name;
  final String email;
  final ValueChanged<String> onSubmitted;

  @override
  State<_MembershipRequestView> createState() =>
      _MembershipRequestViewState();
}

class _MembershipRequestViewState extends State<_MembershipRequestView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  final _phone = TextEditingController();
  final _governorate = TextEditingController();
  final _district = TextEditingController();
  final _cadaster = TextEditingController();
  final _troop = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _governorate.dispose();
    _district.dispose();
    _cadaster.dispose();
    _troop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Membership request'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppSpacing.pageWithBottom,
          children: [
            AppText.paragraph(
              'Complete your request before accessing the application.',
            ),
            AppGap.verticalLg,
            _field(_name, 'Full name'),
            AppGap.verticalSm,
            TextFormField(
              initialValue: widget.email,
              enabled: false,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            AppGap.verticalSm,
            _field(_phone, 'Phone', keyboardType: TextInputType.phone),
            AppGap.verticalSm,
            _field(_governorate, 'Governorate'),
            AppGap.verticalSm,
            _field(_district, 'District'),
            AppGap.verticalSm,
            _field(_cadaster, 'Cadaster'),
            AppGap.verticalSm,
            TextFormField(
              controller: _troop,
              decoration: const InputDecoration(
                labelText: 'Troop',
                helperText:
                    'Leave empty when no troop exists; the request will be sent to the commission.',
              ),
            ),
            AppGap.verticalXl,
            AppButton.filled(
              label: 'Submit membership request',
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _field(
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

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    widget.onSubmitted('REQ-${DateTime.now().millisecondsSinceEpoch}');
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
