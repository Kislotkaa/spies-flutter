import 'package:flutter/material.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.chipsEnum = ChipsEnum.fill,
  });

  final Function() onTap;
  final String text;
  final ChipsEnum chipsEnum;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: getButtonStyle(),
      onPressed: onTap,
      child: Text(
        text,
        style: getTextStyle(),
      ),
    );
  }

  TextStyle getTextStyle() {
    final defaultText = appTheme.textTheme.bodySemibold18;
    switch (chipsEnum) {
      case ChipsEnum.fill:
        return defaultText.copyWith(color: appTheme.alwaysWhiteColor);
      case ChipsEnum.outline:
        return defaultText;
    }
  }

  ButtonStyle getButtonStyle() {
    final defualtStyle = ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, 50)),
      elevation: WidgetStatePropertyAll(0),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 32)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(36))),
    );
    switch (chipsEnum) {
      case ChipsEnum.fill:
        return _fillButtonStyle(defualtStyle);
      case ChipsEnum.outline:
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

enum ChipsEnum { fill, outline }
