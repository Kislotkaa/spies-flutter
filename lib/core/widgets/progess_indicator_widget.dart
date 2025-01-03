import 'package:flutter/material.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    this.state = ProgressIndicatorEnum.circular,
    this.shimmerChild,
  });

  final ProgressIndicatorEnum state;
  final Widget? shimmerChild;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ProgressIndicatorEnum.circular:
        return SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(),
        );
      case ProgressIndicatorEnum.linear:
        return LinearProgressIndicator();
      case ProgressIndicatorEnum.shimmer:
        return Shimmer.fromColors(
          baseColor: appTheme.cardColor.withOpacity(0.3),
          highlightColor: appTheme.cardColor,
          child: shimmerChild ??
              Text(
                'Shimmer',
                textAlign: TextAlign.center,
                style: appTheme.textTheme.bodyExtrabold16,
              ),
        );
    }
  }
}

enum ProgressIndicatorEnum { circular, linear, shimmer }
