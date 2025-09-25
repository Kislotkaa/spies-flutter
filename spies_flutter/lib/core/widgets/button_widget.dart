import 'package:flutter/material.dart';
import 'package:sample/core/cubits/theme_cubit.dart';

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

  TextStyle get _getDefaultTextStyle => appTheme.textTheme.bodySemibold18;

  ButtonStyle get _getDefaultStyle => ButtonStyle(
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: _getButtonStyle,
        onPressed: onTap,
        child: Text(
          text,
          style: _getTextStyle,
        ),
      ),
    );
  }

  TextStyle get _getTextStyle => switch (state) {
        ButtonStateEnum.fill => _getDefaultTextStyle.copyWith(
            color: appTheme.alwaysWhiteColor,
          ),
        ButtonStateEnum.outline => _getDefaultTextStyle,
      };

  ButtonStyle get _getButtonStyle => switch (state) {
        ButtonStateEnum.fill => _getDefaultStyle.copyWith(
            backgroundColor: WidgetStatePropertyAll(appTheme.primaryColor),
            overlayColor: WidgetStatePropertyAll(appTheme.revertBasicColor),
          ),
        ButtonStateEnum.outline => _getDefaultStyle.copyWith(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            overlayColor: WidgetStatePropertyAll(appTheme.cardColor),
            side: WidgetStatePropertyAll(
              BorderSide(color: appTheme.textGrayColor),
            ),
          ),
      };
}
