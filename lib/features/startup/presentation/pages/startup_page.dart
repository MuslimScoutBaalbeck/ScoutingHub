import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/utils/enums/launch_destination.dart';
import 'package:scouting_hub/core/utils/enums/page_status.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';
import 'package:scouting_hub/features/startup/presentation/widgets/startup_failure.dart';
import 'package:scouting_hub/features/startup/presentation/widgets/startup_loading.dart';

@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApplicationStartCubit>().start();
    });
  }

  Future<void> _navigateToDestination(
    AppLaunchDestination destination,
  ) async {
    if (!mounted) {
      return;
    }

    switch (destination) {
      case AppLaunchDestination.setup:
      case AppLaunchDestination.login:
      case AppLaunchDestination.pinUnlock:
      case AppLaunchDestination.home:
        await context.router.replaceAll([const HomeRoute()]);
        return;

      case AppLaunchDestination.failure:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplicationStartCubit, ApplicationStartState>(
      listenWhen: (previous, current) {
        return previous.launchDestination != current.launchDestination;
      },
      listener: (context, state) async {
        final destination = state.launchDestination;

        if (destination == null) {
          return;
        }

        await _navigateToDestination(destination);
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ApplicationStartCubit, ApplicationStartState>(
            builder: (context, state) {
              if (state.pageStatus == PageStatus.failure) {
                return StartupFailure(
                  error: state.errorMessage,
                  onRetry: () => context.read<ApplicationStartCubit>().start(),
                );
              }

              return const StartupLoading();
            },
          ),
        ),
      ),
    );
  }
}
