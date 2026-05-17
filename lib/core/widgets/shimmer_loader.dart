import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/color_constants.dart';

class ShimmerLoader extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerLoader({
    super.key,
    this.width = double.infinity,
    this.height = 80,
    this.borderRadius = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorConstants.cardSurface,
      highlightColor: ColorConstants.neonViolet.withOpacity(0.2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
