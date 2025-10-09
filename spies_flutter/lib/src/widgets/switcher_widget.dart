import 'package:flutter/material.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/feedback_widget.dart';

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

class _SwitcherWidgetState extends State<SwitcherWidget> {
  bool isPressed = false;

  @override
  void initState() {
    isPressed = widget.initialActive;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isPressed = widget.initialActive;
    super.didChangeDependencies();
  }

  void _onPress() {
    setState(() {
      isPressed = !isPressed;
      widget.callBack?.call(isPressed);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return FeedbackWidget(
      isEnabled: widget.callBack != null,
      withHapticFeedback: true,
      child: GestureDetector(
        onTap: _onPress,
        child: AnimatedContainer(
          height: 28,
          width: 55,
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: isPressed ? colorTheme.greenColor : colorTheme.cardColor,
            borderRadius: BorderRadius.circular(32),
          ),
          padding: const EdgeInsets.all(3),
          duration: Durations.short3,
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
      ),
    );
  }
}
