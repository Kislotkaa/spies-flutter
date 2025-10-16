import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/utils/context_extension.dart';

class LogoWidget extends StatelessWidget {
  final double size;

  const LogoWidget({
    super.key,
    this.size = 288,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return Hero(
      tag: Assets.icons.logo.keyName,
      child: Assets.icons.logo.svg(
        height: size,
        width: size,
        colorFilter: ColorFilter.mode(
          colorTheme.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
