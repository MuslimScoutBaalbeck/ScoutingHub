import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/features/auth/application/register/register_cubit.dart';
import 'package:scouting_hub/features/auth/presentation/extensions/auth_error_key_x.dart';
import 'package:scouting_hub/features/auth/presentation/widgets/auth_text_field.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<RegisterCubit>(), child: this);
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.register;

    return Scaffold(
      appBar: AppBar(title: Text(strings.submit)),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) =>
            previous.error != current.error ||
            previous.session != current.session,
        listener: (context, state) async {
          final error = state.error;
          if (error != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(error.translate(context))));
          }
          if (state.session != null) {
            await context.router.replaceAll([const HomeRoute()]);
          }
        },
        builder: (context, state) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
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
                  const SizedBox(height: 24),
                  AuthTextField(
                    controller: _nameController,
                    label: strings.name,
                    textInputAction: TextInputAction.next,
                    enabled: !state.isLoading,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _emailController,
                    label: strings.email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    enabled: !state.isLoading,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _passwordController,
                    label: strings.password,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    enabled: !state.isLoading,
                  ),
                  const SizedBox(height: 8),
                  Text(strings.password_hint),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _confirmationController,
                    label: strings.password_confirmation,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
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
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(strings.have_account),
                      TextButton(
                        onPressed: state.isLoading
                            ? null
                            : () => context.router.maybePop(),
                        child: Text(strings.login),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _submit() {
    return context.read<RegisterCubit>().submit(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmation: _confirmationController.text,
    );
  }
}
