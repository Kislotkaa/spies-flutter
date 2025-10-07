import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin FeedBackMixin {
  bool isPressed = false;
  bool _isProcess = false;
  Duration duration = Durations.short2;

  void onLongPressState(
    bool isPressed, {
    Function()? callBack,
    required Function(VoidCallback fn) setState,
  }) {
    if (callBack == null) return;
    setState(() => this.isPressed = isPressed);
  }

  void onLongPressEvent({
    Function()? callBack,
    required bool withFeedback,
    required Function(VoidCallback fn) setState,
  }) {
    if (callBack == null) return;
    setState(() => isPressed = true);
    if (withFeedback) HapticFeedback.mediumImpact();
    callBack.call();
  }

  Future<void> onTapEvent({
    Function()? callBack,
    required bool withFeedback,
    required Function(VoidCallback fn) setState,
  }) async {
    if (_isProcess || callBack == null) return;
    _isProcess = true;
    setState(() => isPressed = true);
    await Future.delayed(duration);
    callBack.call();
    if (withFeedback) HapticFeedback.mediumImpact();
    setState(() => isPressed = false);
    _isProcess = false;
  }

  Future<void> pressSwitch({
    Function()? callBack,
    required bool withFeedback,
    required Function(VoidCallback fn) setState,
  }) async {
    if (_isProcess || callBack == null) return;
    _isProcess = true;
    setState(() => isPressed = !isPressed);
    await Future.delayed(duration);
    HapticFeedback.mediumImpact();
    callBack.call();
    _isProcess = false;
  }
}
