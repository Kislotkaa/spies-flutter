import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin ButtonMixin {
  bool flag = false;
  bool isProcess = false;
  Duration duration = Durations.short2;

  void longPressSetState(
    bool flag, {
    Function()? onLongTap,
    required Function(VoidCallback fn) setState,
  }) {
    if (onLongTap == null) return;
    setState(() => this.flag = flag);
  }

  void longPressStart({
    Function()? onLongTap,
    required bool withFeedback,
    required Function(VoidCallback fn) setState,
  }) {
    if (onLongTap == null) return;
    setState(() => flag = true);
    if (withFeedback) HapticFeedback.mediumImpact();
    onLongTap.call();
  }

  Future<void> press({
    Function()? onTap,
    required bool withFeedback,
    required Function(VoidCallback fn) setState,
  }) async {
    if (isProcess || onTap == null) return;
    isProcess = true;
    setState(() => flag = true);
    await Future.delayed(duration);
    onTap.call();
    if (withFeedback) HapticFeedback.mediumImpact();
    setState(() => flag = false);
    isProcess = false;
  }

  Future<void> pressSwitch({
    Function()? onTap,
    required bool withFeedback,
    required Function(VoidCallback fn) setState,
  }) async {
    if (isProcess || onTap == null) return;
    isProcess = true;
    setState(() => flag = !flag);
    await Future.delayed(duration);
    HapticFeedback.mediumImpact();
    onTap.call();
    isProcess = false;
  }
}
