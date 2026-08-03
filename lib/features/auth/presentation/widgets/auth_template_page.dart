import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/app_decorative_background.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_back_button.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_gap.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_text.dart';

class AuthTemplatePage extends StatelessWidget {
  const AuthTemplatePage({
    required this.title,
    required this.subtitle,
    required this.child,
    super.key,
    this.logoWidth = AppSize.logoLg,
    this.logoHeight = AppSize.logoLg,
    this.maxWidth = AppSize.contentMaxWidth,
    this.contentSpacing = AppSpacing.xl,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final double logoWidth;
  final double logoHeight;
  final double maxWidth;
  final double contentSpacing;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final canPop = context.router.canPop();
    final contentTopPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + AppSpacing.xs;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: canPop ? 58 : null,
        leading: canPop ? const AppBackButton() : null,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AppDecorativeBackground(
            topOpacity: .05,
            bottomOpacity: .035,
          ),
          SafeArea(
            top: false,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    contentTopPadding,
                    AppSpacing.lg,
                    AppSpacing.xl,
                  ),
                  shrinkWrap: true,
                  children: [
                    Align(
                      child: SvgPicture.asset(
                        'assets/branding/muslim_scout_logo.svg',
                        width: logoWidth,
                        height: logoHeight,
                        colorFilter: ColorFilter.mode(
                          colors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    AppGap.verticalLg,
                    AppText.heading(
                      title,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                    AppGap.verticalXs,
                    AppText.body(
                      subtitle,
                      textAlign: TextAlign.center,
                      color: colors.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: contentSpacing),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
