import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:shimmer/shimmer.dart';

enum ProgressIndicatorEnum { circular, linear, shimmer }

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    this.state = ProgressIndicatorEnum.circular,
    this.shimmerChild,
    this.padding,
    this.size = 24,
  });

  final ProgressIndicatorEnum state;
  final Widget? shimmerChild;
  final EdgeInsets? padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: switch (state) {
        ProgressIndicatorEnum.circular => SizedBox.square(
            dimension: size,
            child: const CircularProgressIndicator(),
          ),
        ProgressIndicatorEnum.linear => const LinearProgressIndicator(),
        ProgressIndicatorEnum.shimmer => Shimmer.fromColors(
            baseColor: colorTheme.cardColor.withOpacity(0.3),
            highlightColor: colorTheme.cardColor,
            child: shimmerChild ?? const SizedBox.shrink(),
          ),
      },
    );
  }
}
