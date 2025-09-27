import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/button_animation_mixin.dart';

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
    final appTheme = context.read<ThemeCubit>().appTheme;

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
          color: isPressed ? appTheme.greenColor : appTheme.cardColor,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: const EdgeInsets.all(3),
        duration: duration,
        alignment: isPressed ? Alignment.centerRight : Alignment.centerLeft,
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
