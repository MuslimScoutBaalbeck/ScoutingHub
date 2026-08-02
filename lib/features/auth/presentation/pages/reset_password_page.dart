import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/features/auth/application/cubit/auth_cubit.dart';
import 'package:scouting_hub/features/auth/application/cubit/auth_state.dart';
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
      create: (_) => getIt<AuthCubit>(),
      child: this,
    );
  }
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final TextEditingController _emailController;
  final _codeController = TextEditingController(text: '123456');
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

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

    return Scaffold(
      appBar: AppBar(title: Text(strings.title)),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state case AuthError(:final message)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          }

          if (state case AuthActionSuccess(action: AuthAction.resetPassword)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(strings.success)));
            await context.router.replaceAll([const LoginRoute()]);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: ListView(
                padding: const EdgeInsets.all(24),
                shrinkWrap: true,
                children: [
                  Text(
                    strings.subtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  AuthTextField(
                    controller: _emailController,
                    label: strings.email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _codeController,
                    label: strings.code,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _passwordController,
                    label: strings.password,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _confirmationController,
                    label: strings.password_confirmation,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
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
      ),
    );
  }

  Future<void> _submit() async {
    final strings = context.t.auth.reset_password;
    if (_passwordController.text != _confirmationController.text ||
        _passwordController.text.length < 8) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(strings.validation_error)));
      return;
    }

    await context.read<AuthCubit>().resetPassword(
      email: _emailController.text,
      code: _codeController.text,
      password: _passwordController.text,
    );
  }
}
