import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.withFeedback = false,
  });

  final VoidCallback? onTap;
  final String text;
  final bool withFeedback;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return FeedbackWidget(
      isEnabled: onTap != null,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: textTheme.semi14,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
