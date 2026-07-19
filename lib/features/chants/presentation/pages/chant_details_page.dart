import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:scouting_hub/core/ui/theme/scouting_hub_brand.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/presentation/chant_ui_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ChantDetailsPage extends StatelessWidget {
  const ChantDetailsPage({required this.chant, super.key});

  final Chant chant;

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final strings = ChantUiStrings(languageCode);
    final fTheme = context.theme;
    final brand = fTheme.scoutingHub;
    final materialTheme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width < fTheme.breakpoints.sm ? 16.0 : 24.0;

    return FScaffold(
      childPad: false,
      header: FHeader.nested(
        title: Text(chant.titleFor(languageCode)),
        prefixes: [
          FHeaderAction.back(onPress: () => Navigator.of(context).pop()),
        ],
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: SelectionArea(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                16,
                horizontalPadding,
                40,
              ),
              children: [
                FCard(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      width < fTheme.breakpoints.sm ? 24 : 32,
                    ),
                    decoration: BoxDecoration(
                      gradient: brand.heroGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FLucideIcons.music,
                          color: Colors.white,
                          size: 42,
                        ),
                        const SizedBox(height: 28),
                        Text(
                          chant.titleFor(languageCode),
                          style: materialTheme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chant.code,
                          style: materialTheme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (chant.hasYoutube)
                  FButton(
                    variant: FButtonVariant.outline,
                    onPress: () => _openYoutube(context, strings),
                    prefix: Icon(
                      FLucideIcons.youtube,
                      color: brand.youtube,
                    ),
                    child: Text(strings.youtube),
                  ),
                const SizedBox(height: 28),
                Text(
                  strings.lyrics,
                  style: materialTheme.textTheme.titleLarge?.copyWith(
                    color: fTheme.colors.foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                FCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      chant.lyricsFor(languageCode),
                      style: materialTheme.textTheme.bodyLarge?.copyWith(
                        color: fTheme.colors.foreground,
                        height: 1.9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      _showVideoError(context, strings.noVideo);
      return;
    }

    final launched = await launchUrl(
      Uri.parse(rawUrl),
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      _showVideoError(context, strings.noVideo);
    }
  }

  void _showVideoError(BuildContext context, String message) {
    showFToast(
      context: context,
      alignment: FToastAlignment.bottomCenter,
      title: Text(message),
    );
  }
}
