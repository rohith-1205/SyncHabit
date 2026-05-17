import 'package:flutter/material.dart';
import '../theme/glassmorphism.dart';
import '../constants/color_constants.dart';

class NeonCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? glowColor;
  final bool isGlowing;

  const NeonCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.glowColor,
    this.isGlowing = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width ?? double.infinity,
      height: height,
      padding: padding,
      margin: margin,
      borderColor: isGlowing
          ? (glowColor ?? ColorConstants.neonViolet)
          : ColorConstants.neonViolet.withOpacity(0.2),
      boxShadow: isGlowing
          ? ColorConstants.neonGlow(glowColor ?? ColorConstants.neonViolet, blurRadius: 20)
          : null,
      child: child,
    );
  }
}
