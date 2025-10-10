import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/utils/context_extension.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return Hero(
      tag: 'logo',
      child: Assets.icons.logo.svg(
        height: 288,
        colorFilter: ColorFilter.mode(
          colorTheme.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
