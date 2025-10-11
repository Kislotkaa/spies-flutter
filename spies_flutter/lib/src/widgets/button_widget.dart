import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';
import 'package:sample/src/widgets/progess_indicator_widget.dart';

enum ButtonStateEnum { fill, outline }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.leftWidget,
    this.rightWidget,
    this.padding,
    this.height = 50,
    this.isLoading = false,
    this.withHapticFeedback = false,
    this.state = ButtonStateEnum.fill,
  });

  final Function() onTap;
  final String text;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final double height;
  final ButtonStateEnum state;
  final EdgeInsets? padding;
  final bool isLoading;
  final bool withHapticFeedback;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    final defaultTextStyle = context.textTheme.semi18;
    final defaultButtnStyle = ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, height)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 32),
      ),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

    return FeedbackWidget(
      scalePattern: 0.9,
      withHapticFeedback: withHapticFeedback,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ElevatedButton(
          style: switch (state) {
            ButtonStateEnum.fill => defaultButtnStyle.copyWith(
                backgroundColor: WidgetStatePropertyAll(colorTheme.primaryColor),
                overlayColor: WidgetStatePropertyAll(colorTheme.alwaysBlackTextColor),
              ),
            ButtonStateEnum.outline => defaultButtnStyle.copyWith(
                backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
                overlayColor: WidgetStatePropertyAll(colorTheme.textGrayColor),
                side: WidgetStatePropertyAll(
                  BorderSide(color: colorTheme.textGrayColor),
                ),
              ),
          },
          onPressed: isLoading ? null : onTap,
          child: isLoading
              ? const ProgressIndicatorWidget(size: 24)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftWidget ?? const SizedBox.square(dimension: 24),
                    Text(
                      text,
                      style: switch (state) {
                        ButtonStateEnum.fill => defaultTextStyle.copyWith(
                            color: colorTheme.alwaysWhiteColor,
                          ),
                        ButtonStateEnum.outline => defaultTextStyle,
                      },
                    ),
                    rightWidget ?? const SizedBox.square(dimension: 24),
                  ],
                ),
        ),
      ),
    );
  }
}
