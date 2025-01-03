import 'package:flutter/material.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.padding,
    this.height = 50,
    this.baseButtonEnum = BaseButtonEnum.fill,
  });

  final Function() onTap;
  final String text;
  final double height;
  final BaseButtonEnum baseButtonEnum;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: getButtonStyle(),
        onPressed: onTap,
        child: Text(
          text,
          style: getTextStyle(),
        ),
      ),
    );
  }

  TextStyle getTextStyle() {
    final defaultText = appTheme.textTheme.bodySemibold18;
    switch (baseButtonEnum) {
      case BaseButtonEnum.fill:
        return defaultText.copyWith(color: appTheme.alwaysWhiteColor);
      case BaseButtonEnum.outline:
        return defaultText;
    }
  }

  ButtonStyle getButtonStyle() {
    final defualtStyle = ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, height)),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 32)),
      elevation: WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
    switch (baseButtonEnum) {
      case BaseButtonEnum.fill:
        return _fillButtonStyle(defualtStyle);
      case BaseButtonEnum.outline:
        return _outlineButtonStyle(defualtStyle);
    }
  }

  ButtonStyle _fillButtonStyle(ButtonStyle defualtStyle) => defualtStyle.copyWith(
        backgroundColor: WidgetStatePropertyAll(appTheme.primaryColor),
      );

  ButtonStyle _outlineButtonStyle(ButtonStyle defualtStyle) => defualtStyle.copyWith(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        side: WidgetStatePropertyAll(BorderSide(color: appTheme.textGrayColor)),
      );
}

enum BaseButtonEnum { fill, outline }
