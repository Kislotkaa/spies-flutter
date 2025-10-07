import 'package:flutter/material.dart';
import 'package:sample/core/utils/button_animation_mixin.dart';
import 'package:sample/core/utils/context_extension.dart';

class CheckerWidget extends StatefulWidget {
  const CheckerWidget({
    super.key,
    this.initialActive = false,
    this.callBack,
  });

  final bool initialActive;
  final Function(bool isActive)? callBack;

  @override
  State<CheckerWidget> createState() => _CheckerWidgetState();
}

class _CheckerWidgetState extends State<CheckerWidget> with ButtonMixin {
  @override
  void initState() {
    isPressed = widget.initialActive;
    duration = Durations.short3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return GestureDetector(
      onTap: () => pressSwitch(
        callBack: () => widget.callBack?.call(isPressed),
        setState: setState,
        withFeedback: true,
      ),
      child: AnimatedContainer(
        height: 28,
        width: 55,
        decoration: BoxDecoration(
          border: Border.all(
            color: isPressed ? colorTheme.textColor : colorTheme.textGrayColor,
            width: isPressed ? 6 : 3,
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(2),
        duration: duration,
      ),
    );
  }
}
