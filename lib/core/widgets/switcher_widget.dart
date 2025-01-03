import 'package:flutter/material.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/utils/button_animation_mixin.dart';

class SwitcherWidget extends StatefulWidget {
  const SwitcherWidget({
    super.key,
    this.initialActive = false,
    this.afterCallBack,
    this.beforeCallBack,
  });

  final bool initialActive;
  final Function(bool isActive)? afterCallBack;
  final Function(bool isActive)? beforeCallBack;

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> with ButtonMixin {
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
        onTap: () => widget.afterCallBack?.call(flag),
        setState: setState,
        withFeedback: true,
      ),
      child: AnimatedContainer(
        height: 28,
        width: 55,
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: flag ? appTheme.greenColor : appTheme.cardColor,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: EdgeInsets.all(3),
        duration: duration,
        alignment: flag ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: appTheme.alwaysWhiteColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
