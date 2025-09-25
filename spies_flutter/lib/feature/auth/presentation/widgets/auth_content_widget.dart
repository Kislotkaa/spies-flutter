import 'package:flutter/material.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/gen/assets.gen.dart';

class AuthContentWidget extends StatelessWidget {
  const AuthContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.logo.svg(
          height: 288,
          colorFilter: ColorFilter.mode(
            appTheme.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 24),
          child: Text(
            'Шпион',
            style: appTheme.textTheme.bodyExtrabold20.copyWith(
              fontSize: 32,
            ),
          ),
        ),
        Text(
          'Ты свой?',
          style: appTheme.textTheme.bodySemibold14.copyWith(
            color: appTheme.textGrayColor,
          ),
        ),
      ],
    );
  }
}
