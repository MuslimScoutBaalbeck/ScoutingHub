import 'package:flutter/material.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/presentation/chant_ui_strings.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ChantDetailsPage extends StatelessWidget {
  const ChantDetailsPage({required this.chant, super.key});

  final Chant chant;

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final strings = ChantUiStrings(languageCode);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(chant.titleFor(languageCode))),
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B5139), Color(0xFF4B2E83)],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(TablerIcons.music, color: Colors.white, size: 42),
                  const SizedBox(height: 28),
                  Text(
                    chant.titleFor(languageCode),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    chant.code,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (chant.hasYoutube)
              FilledButton.icon(
                onPressed: () => _openYoutube(context, strings),
                icon: const Icon(TablerIcons.brandYoutube),
                label: Text(strings.youtube),
              ),
            const SizedBox(height: 28),
            Text(
              strings.lyrics,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Text(
                chant.lyricsFor(languageCode),
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openYoutube(
    BuildContext context,
    ChantUiStrings strings,
  ) async {
    final rawUrl = chant.youtubeUrl;
    if (rawUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(strings.noVideo)),
      );
      return;
    }

    final launched = await launchUrl(
      Uri.parse(rawUrl),
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(strings.noVideo)),
      );
    }
  }
}
