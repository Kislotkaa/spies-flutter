import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';

enum BadgeTypeEnum { push, faq, invitation, all }

class BadgeWidget extends StatelessWidget {
  final int count;
  final Alignment alignment;
  final Offset? offset;
  final Widget? child;

  const BadgeWidget({
    super.key,
    this.child,
    required this.count,
    this.alignment = Alignment.topRight,
    this.offset = const Offset(2, -2),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorTheme = context.colorTheme;

    return Badge.count(
      offset: offset,
      isLabelVisible: count > 0,
      count: count,
      textColor: colorTheme.alwaysWhiteTextColor,
      textStyle: textTheme.semi12,
      backgroundColor: colorTheme.redColor,
      alignment: alignment,
      child: child,
    );
  }
}
