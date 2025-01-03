import 'package:flutter/material.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/utils/button_animation_mixin.dart';

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
    flag = widget.initialActive;
    duration = Durations.short3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressSwitch(
        onTap: () => widget.callBack?.call(flag),
        setState: setState,
        withFeedback: true,
      ),
      child: AnimatedContainer(
        height: 28,
        width: 55,
        decoration: BoxDecoration(
          border: Border.all(color: flag ? appTheme.textColor : appTheme.textGrayColor, width: flag ? 6 : 3),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(2),
        duration: duration,
      ),
    );
  }
}
