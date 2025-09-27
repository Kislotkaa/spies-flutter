import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/button_animation_mixin.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.text,
    this.onTap,
    this.onLongPress,
    this.iconSize = 24,
    this.withFeedback = false,
    this.iconColor,
    this.padding = EdgeInsets.zero,
    this.paddingIcon = EdgeInsets.zero,
  });

  final SvgGenImage icon;
  final Function()? onTap;
  final Function()? onLongPress;
  final bool withFeedback;
  final Text? text;
  final double iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingIcon;

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> with ButtonMixin {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<ThemeCubit>().appTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPressCancel: () => onLongPressState(
        false,
        callBack: widget.onLongPress,
        setState: setState,
      ),
      onLongPressEnd: (_) => onLongPressState(
        false,
        callBack: widget.onLongPress,
        setState: setState,
      ),
      onLongPressDown: (_) => onLongPressState(
        true,
        callBack: widget.onLongPress,
        setState: setState,
      ),
      onLongPressStart: (_) => onLongPressEvent(
        callBack: widget.onLongPress,
        withFeedback: widget.withFeedback,
        setState: setState,
      ),
      onTap: () => onTapEvent(
        callBack: widget.onTap,
        withFeedback: widget.withFeedback,
        setState: setState,
      ),
      child: SizedBox(
        width: widget.iconSize + widget.padding.horizontal,
        height: widget.iconSize + widget.padding.vertical,
        child: Center(
          child: AnimatedContainer(
            height: isPressed ? widget.iconSize * 0.8 : widget.iconSize,
            width: isPressed ? widget.iconSize * 0.8 : widget.iconSize,
            duration: duration,
            child: FittedBox(
              child: widget.icon.svg(
                colorFilter: ColorFilter.mode(
                  widget.iconColor ?? appTheme.textColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
