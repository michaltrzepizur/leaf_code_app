import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Animation<double> animation;
  final double scrollOffset;

  const AppBackground({
    super.key,
    required this.animation,
    required this.scrollOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔽 Lewy dolny róg (zielony glow, animowany)
        Positioned(
          right: -200,
          bottom: -200,
          child: ScaleTransition(
            scale: animation,
            child: Container(
              width: 450,
              height: 450,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(112, 239, 52, 0.671),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),

        // 🔽 Prawy górny róg (turkusowy glow, animowany)
        Positioned(
          left: -200,
          top: -200,
          child: ScaleTransition(
            scale: animation,
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(0, 240, 255, 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
