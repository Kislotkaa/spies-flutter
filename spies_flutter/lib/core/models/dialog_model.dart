import 'package:flutter/material.dart';
import 'package:sample/src/widgets/button_widget.dart';

class DialogModel {
  final String? title;
  final String? subTitle;
  final List<Widget> children;
  final List<DialogButtonModel> buttons;

  DialogModel({
    required this.title,
    required this.subTitle,
    required this.children,
    required this.buttons,
  });
}

class DialogButtonModel {
  final String title;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final ButtonStateEnum? state;

  DialogButtonModel({
    required this.title,
    this.onTap,
    this.padding,
    this.state,
  });
}
