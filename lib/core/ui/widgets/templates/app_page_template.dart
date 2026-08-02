import 'package:flutter/material.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/atoms/app_back_button.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({
    required this.body,
    super.key,
    this.title,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.showBackButton = false,
    this.extendBodyBehindAppBar = false,
    this.background,
    this.padding = AppSpacing.pageWithBottom,
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final bool extendBodyBehindAppBar;
  final Widget? background;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final content = Padding(padding: padding, child: body);

    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: title != null || showBackButton || actions != null
          ? AppBar(
              leading: showBackButton ? const AppBackButton() : null,
              automaticallyImplyLeading: false,
              title: title == null ? null : Text(title!),
              actions: actions,
            )
          : null,
      body: background == null
          ? SafeArea(child: content)
          : Stack(
              fit: StackFit.expand,
              children: [background!, SafeArea(child: content)],
            ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}