import 'package:flutter/material.dart';

extension Separated on List<Widget> {
  List<Widget> separatedBy(Widget separator) {
    if (length < 2) return this;
    return [
      for (int i = 0; i < length; i++) ...[
        this[i],
        if (i != length - 1) separator,
      ]
    ];
  }
}
