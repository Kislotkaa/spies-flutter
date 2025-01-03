import 'package:flutter/material.dart';
import 'package:spies/core/gen/assets.gen.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/utils/button_animation_mixin.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    this.text,
    this.onTap,
    this.onLongTap,
    this.iconSize = 24,
    this.withFeedback = false,
    this.iconColor,
    this.padding = EdgeInsets.zero,
    this.paddingIcon = EdgeInsets.zero,
    this.iconPositionEnum = IconPositionEnum.none,
  });

  final SvgGenImage icon;
  final Function()? onTap;
  final Function()? onLongTap;
  final bool withFeedback;

  final Text? text;
  final double iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? paddingIcon;

  final IconPositionEnum iconPositionEnum;

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> with ButtonMixin {
  @override
  Widget build(BuildContext context) {
    final iconChild = GestureDetector(
      onLongPressCancel: () => longPressSetState(false, onLongTap: widget.onLongTap, setState: setState),
      onLongPressEnd: (_) => longPressSetState(false, onLongTap: widget.onLongTap, setState: setState),
      onLongPressDown: (_) => longPressSetState(true, onLongTap: widget.onLongTap, setState: setState),
      onLongPressStart: (_) =>
          longPressStart(onLongTap: widget.onLongTap, withFeedback: widget.withFeedback, setState: setState),
      onTap: () => press(
        onTap: widget.onTap,
        withFeedback: widget.withFeedback,
        setState: setState,
      ),
      child: Container(
        color: Colors.transparent,
        width: widget.iconSize + widget.padding.horizontal,
        height: widget.iconSize + widget.padding.vertical,
        child: Center(
          child: AnimatedContainer(
            height: flag ? widget.iconSize * 0.8 : widget.iconSize,
            width: flag ? widget.iconSize * 0.8 : widget.iconSize,
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

    switch (widget.iconPositionEnum) {
      case IconPositionEnum.bottom:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            iconChild,
            if (widget.text != null)
              Padding(
                padding: widget.paddingIcon ?? EdgeInsets.only(bottom: 2),
                child: widget.text,
              ),
          ],
        );
      case IconPositionEnum.right:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            iconChild,
            if (widget.text != null)
              Padding(
                padding: widget.paddingIcon ?? EdgeInsets.only(right: 4),
                child: widget.text,
              ),
          ],
        );
      case IconPositionEnum.none:
        return iconChild;
    }
  }
}

enum IconPositionEnum { bottom, right, none }
