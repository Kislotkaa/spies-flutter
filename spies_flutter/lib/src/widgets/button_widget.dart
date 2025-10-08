import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';

enum ButtonStateEnum { fill, outline }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.padding,
    this.height = 50,
    this.isChips = false,
    this.state = ButtonStateEnum.fill,
  });

  final Function() onTap;
  final String text;
  final double height;
  final ButtonStateEnum state;
  final EdgeInsets? padding;
  final bool isChips;

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
          borderRadius: BorderRadius.circular(isChips ? 36 : 12),
        ),
      ),
    );

    return FeedbackWidget(
      scalePattern: 0.9,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ElevatedButton(
          style: switch (state) {
            ButtonStateEnum.fill => defaultButtnStyle.copyWith(
                backgroundColor: WidgetStatePropertyAll(colorTheme.primaryColor),
                overlayColor: WidgetStatePropertyAll(colorTheme.revertBasicColor),
              ),
            ButtonStateEnum.outline => defaultButtnStyle.copyWith(
                backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
                overlayColor: WidgetStatePropertyAll(colorTheme.cardColor),
                side: WidgetStatePropertyAll(
                  BorderSide(color: colorTheme.textGrayColor),
                ),
              ),
          },
          onPressed: onTap,
          child: Text(
            text,
            style: switch (state) {
              ButtonStateEnum.fill => defaultTextStyle.copyWith(
                  color: colorTheme.alwaysWhiteColor,
                ),
              ButtonStateEnum.outline => defaultTextStyle,
            },
          ),
        ),
      ),
    );
  }
}
