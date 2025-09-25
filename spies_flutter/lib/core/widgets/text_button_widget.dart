import 'package:flutter/material.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/button_animation_mixin.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.onLongTap,
    this.withFeedback = false,
  });

  final Function()? onTap;
  final Function()? onLongTap;
  final String text;
  final bool withFeedback;

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> with ButtonMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPressCancel: () => onLongPressState(false, callBack: widget.onLongTap, setState: setState),
      onLongPressEnd: (_) => onLongPressState(false, callBack: widget.onLongTap, setState: setState),
      onLongPressDown: (_) => onLongPressState(true, callBack: widget.onLongTap, setState: setState),
      onLongPressStart: (_) =>
          onLongPressEvent(callBack: widget.onLongTap, withFeedback: widget.withFeedback, setState: setState),
      onTap: () => onTapEvent(
        callBack: widget.onTap,
        withFeedback: widget.withFeedback,
        setState: setState,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AnimatedScale(
          scale: isPressed ? 0.8 : 1,
          duration: duration,
          child: Text(
            widget.text,
            style: appTheme.textTheme.bodySemibold14,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
