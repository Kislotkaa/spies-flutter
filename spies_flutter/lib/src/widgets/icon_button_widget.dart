import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';

import 'package:sample/core/utils/context_extension.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.iconSize = 24,
    this.iconColor,
    this.padding = EdgeInsets.zero,
    this.paddingIcon = EdgeInsets.zero,
  });

  final SvgGenImage icon;
  final Function()? onTap;
  final double iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingIcon;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding.horizontal,
          vertical: padding.vertical,
        ),
        child: icon.svg(
          height: iconSize,
          width: iconSize,
          colorFilter: ColorFilter.mode(
            iconColor ?? colorTheme.textColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
