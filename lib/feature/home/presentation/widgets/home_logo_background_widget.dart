import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spies/core/constants/enums.dart';
import 'package:spies/core/gen/assets.gen.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/feature/home/presentation/bloc/home_bloc.dart';

class HomeLogoBackgroundWidget extends StatelessWidget {
  const HomeLogoBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final icon = Assets.icons.logo.svg(
      colorFilter: ColorFilter.mode(appTheme.textGrayColor, BlendMode.srcIn),
    );

    return Positioned(
      top: 0,
      bottom: MediaQuery.of(context).size.height * 0.5,
      right: 0,
      left: 0,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current.status == StateStatus.loading || current.status != StateStatus.loading,
        builder: (context, state) {
          return Hero(
            tag: 'logo_spies',
            child: state.status == StateStatus.loading
                ? Shimmer.fromColors(
                    baseColor: appTheme.cardColor.withOpacity(0.3),
                    highlightColor: appTheme.cardColor,
                    child: icon,
                  )
                : icon,
          );
        },
      ),
    );
  }
}
