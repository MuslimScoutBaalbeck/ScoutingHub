import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/features/auth/application/forgot_password/forgot_password_cubit.dart';
import 'package:scouting_hub/features/auth/presentation/extensions/auth_error_key_x.dart';
import 'package:scouting_hub/features/auth/presentation/widgets/auth_text_field.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: this,
    );
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController(text: 'demo@example.com');

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.forgot_password;

    return Scaffold(
      appBar: AppBar(title: Text(strings.title)),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
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
            await context.router.push(
              ResetPasswordRoute(email: _emailController.text.trim()),
            );
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
                    strings.subtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  AuthTextField(
                    controller: _emailController,
                    label: strings.email,
                    keyboardType: TextInputType.emailAddress,
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
                  TextButton(
                    onPressed: state.isLoading
                        ? null
                        : () => context.router.maybePop(),
                    child: Text(strings.back_to_login),
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
    return context.read<ForgotPasswordCubit>().submit(
      email: _emailController.text,
    );
  }
}
