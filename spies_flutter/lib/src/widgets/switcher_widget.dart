import 'package:flutter/material.dart';
import 'package:sample/core/utils/button_animation_mixin.dart';
import 'package:sample/core/utils/context_extension.dart';

class SwitcherWidget extends StatefulWidget {
  const SwitcherWidget({
    super.key,
    this.initialActive = false,
    this.callBack,
  });

  final bool initialActive;
  final Function(bool isActive)? callBack;

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> with ButtonMixin {
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
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: isPressed ? colorTheme.greenColor : colorTheme.cardColor,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: const EdgeInsets.all(3),
        duration: duration,
        alignment: isPressed ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: colorTheme.alwaysWhiteColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
