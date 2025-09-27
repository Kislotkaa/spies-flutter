import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:shimmer/shimmer.dart';

enum ProgressIndicatorEnum { circular, linear, shimmer }

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
    final appTheme = context.read<ThemeCubit>().appTheme;

    return switch (state) {
      ProgressIndicatorEnum.circular => const SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(),
        ),
      ProgressIndicatorEnum.linear => const LinearProgressIndicator(),
      ProgressIndicatorEnum.shimmer => Shimmer.fromColors(
          baseColor: appTheme.cardColor.withOpacity(0.3),
          highlightColor: appTheme.cardColor,
          child: shimmerChild ?? const SizedBox.shrink(),
        ),
    };
  }
}
