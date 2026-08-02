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
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(text: 'demo@example.com');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.login;

    return Scaffold(
      appBar: AppBar(title: Text(strings.submit)),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state case AuthError(:final message)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          }

          if (state is AuthAuthenticated) {
            context.router.replaceAll([const HomeRoute()]);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: AutofillGroup(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  shrinkWrap: true,
                  children: [
                    Text(
                      strings.title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(strings.subtitle),
                    const SizedBox(height: 20),
                    Text(
                      strings.demo_credentials,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      controller: _emailController,
                      label: strings.email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _passwordController,
                      label: strings.password,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _submit(),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: isLoading
                            ? null
                            : () => context.router.push(
                                  const ForgotPasswordRoute(),
                                ),
                        child: Text(strings.forgot_password),
                      ),
                    ),
                    FilledButton(
                      onPressed: isLoading ? null : _submit,
                      child: isLoading
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(strings.submit),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(strings.no_account),
                        TextButton(
                          onPressed: isLoading
                              ? null
                              : () => context.router.push(
                                    const RegisterRoute(),
                                  ),
                          child: Text(strings.register),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _submit() {
    return context.read<AuthCubit>().login(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }
}
