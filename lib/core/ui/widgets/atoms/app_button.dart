import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton._({
    required this.label,
    required this.variant,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.expand = true,
    super.key,
  });

  const AppButton.filled({
    required String label,
    required VoidCallback? onPressed,
    Widget? icon,
    bool isLoading = false,
    bool expand = true,
    Key? key,
  }) : this._(
         key: key,
         label: label,
         variant: AppButtonVariant.filled,
         onPressed: onPressed,
         icon: icon,
         isLoading: isLoading,
         expand: expand,
       );

  const AppButton.outline({
    required String label,
    required VoidCallback? onPressed,
    Widget? icon,
    bool isLoading = false,
    bool expand = true,
    Key? key,
  }) : this._(
         key: key,
         label: label,
         variant: AppButtonVariant.outline,
         onPressed: onPressed,
         icon: icon,
         isLoading: isLoading,
         expand: expand,
       );

  const AppButton.text({
    required String label,
    required VoidCallback? onPressed,
    Widget? icon,
    bool isLoading = false,
    bool expand = false,
    Key? key,
  }) : this._(
         key: key,
         label: label,
         variant: AppButtonVariant.text,
         onPressed: onPressed,
         icon: icon,
         isLoading: isLoading,
         expand: expand,
       );

  final String label;
  final AppButtonVariant variant;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final callback = isLoading ? null : onPressed;
    final content = isLoading
        ? const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, const SizedBox(width: 8)],
              Text(label),
            ],
          );

    final button = switch (variant) {
      AppButtonVariant.filled => FilledButton(
        onPressed: callback,
        child: content,
      ),
      AppButtonVariant.outline => OutlinedButton(
        onPressed: callback,
        child: content,
      ),
      AppButtonVariant.text => TextButton(
        onPressed: callback,
        child: content,
      ),
    };

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}

enum AppButtonVariant { filled, outline, text }
