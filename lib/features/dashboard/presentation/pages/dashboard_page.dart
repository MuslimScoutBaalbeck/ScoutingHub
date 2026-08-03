import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/dashboard/presentation/widgets/quick_access_grid.dart';
import 'package:scouting_hub/features/dashboard/presentation/widgets/upcoming_event_card.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.dashboard;

    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.xxl,
            ),
            sliver: SliverList.list(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<SessionCubit, SessionState>(
                        buildWhen: (previous, current) =>
                            previous.user?.name != current.user?.name,
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.body(
                                strings.welcome_back,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                              AppGap.verticalXxs,
                              AppText.heading(
                                state.user?.name ?? strings.user_name,
                                fontWeight: FontWeight.w800,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    IconButton(
                      tooltip: strings.notifications,
                      onPressed: () => _showComingSoon(context),
                      icon: const Badge(
                        child: Icon(Icons.notifications_none_rounded),
                      ),
                    ),
                  ],
                ),
                AppGap.verticalSm,
                UpcomingEventCard(
                  eyebrow: strings.upcoming_title,
                  title: strings.upcoming_name,
                  details: strings.upcoming_details,
                  onPressed: () => _showComingSoon(context),
                ),
                AppGap.verticalSm,
                AppSectionHeader(title: strings.quick_access),
                AppGap.verticalSm,
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
