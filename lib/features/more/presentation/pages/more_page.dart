import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.home.more;
    final user = context.watch<SessionCubit>().state.user;
    final items = <_MoreItem>[
      _MoreItem(
        icon: Icons.person_outline_rounded,
        label: strings.profile,
      ),
      _MoreItem(
        icon: Icons.notifications_outlined,
        label: strings.notifications,
      ),
      _MoreItem(
        icon: Icons.language_rounded,
        label: strings.language,
        onTap: () => _switchLanguage(context),
      ),
      _MoreItem(
        icon: Icons.dark_mode_outlined,
        label: strings.theme,
        onTap: () => _switchTheme(context),
      ),
      _MoreItem(
        icon: Icons.description_outlined,
        label: strings.meeting_minutes,
        permission: AppPermission.meetingsView,
      ),
      _MoreItem(
        icon: Icons.swap_horiz_rounded,
        label: strings.incoming_outgoing,
        permission: AppPermission.correspondenceView,
      ),
      _MoreItem(
        icon: Icons.inventory_2_outlined,
        label: strings.inventory,
        permission: AppPermission.inventoryView,
      ),
      _MoreItem(
        icon: Icons.event_note_outlined,
        label: strings.activities,
        permission: AppPermission.eventsView,
      ),
      _MoreItem(
        icon: Icons.cabin_outlined,
        label: strings.camps,
        permission: AppPermission.campsView,
      ),
      _MoreItem(
        icon: Icons.support_agent_rounded,
        label: strings.support,
      ),
      _MoreItem(
        icon: Icons.help_outline_rounded,
        label: strings.help,
      ),
    ];
    final visibleItems = items.where((item) {
      final permission = item.permission;
      return permission == null || (user?.hasPermission(permission) ?? false);
    });

    return SafeArea(
      child: ListView(
        padding: AppSpacing.pageWithBottom,
        children: [
          AppPageHeader(title: strings.title),
          AppGap.verticalLg,
          for (final item in visibleItems)
            Card(
              child: ListTile(
                leading: Icon(item.icon),
                title: AppText.paragraph(item.label),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: item.onTap ?? () => _showComingSoon(context),
              ),
            ),
          AppGap.verticalSm,
          AppButton.outline(
            label: strings.logout,
            icon: const Icon(Icons.logout_rounded),
            isLoading: context.watch<SessionCubit>().state.isLoading,
            onPressed: () => _logout(context),
          ),
        ],
      ),
    );
  }

  Future<void> _switchLanguage(BuildContext context) async {
    final next = LocaleSettings.currentLocale == AppLocale.en
        ? AppLocale.ar
        : AppLocale.en;

    await LocaleSettings.setLocale(next);

    if (!context.mounted) {
      return;
    }

    context.read<ApplicationStartCubit>().updateLocale(next.languageCode);
  }

  void _switchTheme(BuildContext context) {
    final mode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    context.read<ApplicationStartCubit>().updateThemeMode(mode);
  }

  Future<void> _logout(BuildContext context) async {
    await context.read<SessionCubit>().logout();

    if (!context.mounted) {
      return;
    }

    await context.router.replaceAll([const LoginRoute()]);
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(context.t.home.common.coming_soon)),
      );
  }
}

final class _MoreItem {
  const _MoreItem({
    required this.icon,
    required this.label,
    this.permission,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final AppPermission? permission;
  final VoidCallback? onTap;
}
