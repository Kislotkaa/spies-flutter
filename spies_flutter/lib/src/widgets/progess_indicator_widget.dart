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
  });

  final ProgressIndicatorEnum state;
  final Widget? shimmerChild;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: switch (state) {
        ProgressIndicatorEnum.circular => const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator(),
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
