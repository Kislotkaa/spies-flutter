import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';

class SettingsItemWidget extends StatelessWidget {
  final String title;
  final SvgGenImage icon;
  final Widget? action;
  final VoidCallback onTap;

  const SettingsItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;
    final textTheme = context.textTheme;

    return FeedbackWidget(
      scalePattern: 0.9,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: colorTheme.basicColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorTheme.cardColor,
            ),
          ),
          child: Row(
            children: [
              icon.svg(colorFilter: ColorFilter.mode(colorTheme.textColor, BlendMode.srcIn)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title,
                    style: textTheme.semi14,
                  ),
                ),
              ),
              action ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
