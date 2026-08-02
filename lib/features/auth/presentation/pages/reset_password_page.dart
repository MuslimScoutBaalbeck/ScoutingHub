import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/features/auth/application/reset_password/reset_password_cubit.dart';
import 'package:scouting_hub/features/auth/presentation/extensions/auth_error_key_x.dart';
import 'package:scouting_hub/features/auth/presentation/widgets/auth_template_page.dart';
import 'package:scouting_hub/features/auth/presentation/widgets/auth_text_field.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ResetPasswordPage({required this.email, super.key});

  final String email;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: this,
    );
  }
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final TextEditingController _emailController;
  final _codeController = TextEditingController(text: '123456');
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmation = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.reset_password;

    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.error != current.error ||
          previous.isSuccess != current.isSuccess,
      listener: (context, state) async {
        final error = state.error;
        if (error != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(error.translate(context))));
        }

        if (state.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(strings.success)));
          await context.router.replaceAll([const LoginRoute()]);
        }
      },
      builder: (context, state) {
        return AuthTemplatePage(
          title: strings.title,
          subtitle: strings.subtitle,
          logoWidth: 130,
          logoHeight: 130,
          contentSpacing: 24,
          child: AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthTextField(
                  controller: _emailController,
                  label: strings.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(Icons.email_outlined),
                  enabled: !state.isLoading,
                ),
                const SizedBox(height: 14),
                AuthTextField(
                  controller: _codeController,
                  label: strings.code,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(Icons.pin_outlined),
                  enabled: !state.isLoading,
                ),
                const SizedBox(height: 14),
                AuthTextField(
                  controller: _passwordController,
                  label: strings.password,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    onPressed: state.isLoading
                        ? null
                        : () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  enabled: !state.isLoading,
                ),
                const SizedBox(height: 14),
                AuthTextField(
                  controller: _confirmationController,
                  label: strings.password_confirmation,
                  obscureText: _obscureConfirmation,
                  textInputAction: TextInputAction.done,
                  prefixIcon: const Icon(Icons.lock_reset_rounded),
                  suffixIcon: IconButton(
                    onPressed: state.isLoading
                        ? null
                        : () => setState(
                            () => _obscureConfirmation = !_obscureConfirmation,
                          ),
                    icon: Icon(
                      _obscureConfirmation
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  enabled: !state.isLoading,
                  onSubmitted: (_) => _submit(),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: state.isLoading ? null : _submit,
                  child: state.isLoading
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(strings.submit),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _submit() {
    return context.read<ResetPasswordCubit>().submit(
      email: _emailController.text,
      code: _codeController.text,
      password: _passwordController.text,
      confirmation: _confirmationController.text,
    );
  }
}
