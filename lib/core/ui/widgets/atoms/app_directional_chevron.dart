import 'package:flutter/material.dart';

class AppDirectionalChevron extends StatelessWidget {
  const AppDirectionalChevron({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Directionality.of(context) == TextDirection.rtl
          ? Icons.chevron_left_rounded
          : Icons.chevron_right_rounded,
      color: color,
      size: size,
    );
  }
}
