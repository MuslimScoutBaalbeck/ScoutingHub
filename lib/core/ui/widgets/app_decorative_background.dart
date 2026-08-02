import 'package:flutter/material.dart';

class AppDecorativeBackground extends StatelessWidget {
  const AppDecorativeBackground({
    super.key,
    this.topCircleSize = 260,
    this.bottomCircleSize = 300,
    this.topOpacity = .07,
    this.bottomOpacity = .05,
  });

  final double topCircleSize;
  final double bottomCircleSize;
  final double topOpacity;
  final double bottomOpacity;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          PositionedDirectional(
            top: -110,
            end: -90,
            child: _DecorativeCircle(
              size: topCircleSize,
              color: primary.withValues(alpha: topOpacity),
            ),
          ),
          PositionedDirectional(
            bottom: -130,
            start: -100,
            child: _DecorativeCircle(
              size: bottomCircleSize,
              color: primary.withValues(alpha: bottomOpacity),
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  const _DecorativeCircle({
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: SizedBox.square(dimension: size),
    );
  }
}
