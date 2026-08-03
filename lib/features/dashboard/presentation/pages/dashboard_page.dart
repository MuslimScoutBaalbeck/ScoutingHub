import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/dashboard/presentation/widgets/assignment_switcher.dart';
import 'package:scouting_hub/features/dashboard/presentation/widgets/quick_access_grid.dart';
import 'package:scouting_hub/features/dashboard/presentation/widgets/upcoming_event_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            titleSpacing: AppSpacing.lg,
            title: BlocBuilder<SessionCubit, SessionState>(
              buildWhen: (previous, current) =>
                  previous.user != current.user,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.caption(strings.welcome_back),
                    AppText.title(
                      state.user?.name ?? strings.user_name,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                );
              },
            ),
            actions: [
              AppSquareAction(
                tooltip: strings.notifications,
                onPressed: () => _showComingSoon(context),
                child: const Badge(
                  child: Icon(Icons.notifications_outlined),
                ),
              ),
              AppGap.horizontalMd,
            ],
          ),
          SliverPadding(
            padding: AppSpacing.pageWithBottom,
            sliver: SliverList.list(
              children: [
                const AssignmentSwitcher(),
                AppGap.verticalLg,
                UpcomingEventCard(
                  eyebrow: strings.upcoming_title,
                  title: strings.upcoming_name,
                  details: strings.upcoming_details,
                ),
                AppGap.verticalLg,
                AppSectionHeader(title: strings.quick_access),
                AppGap.verticalMd,
                QuickAccessGrid(
                  onItemPressed: () => _showComingSoon(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(context.t.home.common.coming_soon)),
      );
  }
}
