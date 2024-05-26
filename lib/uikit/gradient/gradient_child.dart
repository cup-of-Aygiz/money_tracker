import 'package:flutter/material.dart';
import 'package:money_tracker/uikit/uikit.dart';

class GradientChild extends StatelessWidget {
  const GradientChild({
    super.key,
    required this.child,
    this.blendMode = BlendMode.srcIn,
    this.gradient,
  });

  final Widget child;
  final BlendMode blendMode;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    if (gradient != null) {
      return ShaderMask(
        blendMode: blendMode,
        shaderCallback: (Rect bounds) {
          if (gradient == null) {
            return const LinearGradient(
                    colors: [AppColors.main, AppColors.secondary])
                .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          }
          return gradient!
              .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
        },
        child: child,
      );
    }
    return child;
  }
}
