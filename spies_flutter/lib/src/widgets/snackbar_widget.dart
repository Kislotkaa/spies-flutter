import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/src/widgets/button_widget.dart';

OverlayEntry? _previousEntry;

enum SnackbarPosition { BOTTOM, TOP }

enum SnackbarStatus { warning, access, normal, error, info }

class SnackbarButtonModel {
  final Function() onTap;
  final String? text;
  final ButtonStateEnum state;

  SnackbarButtonModel({
    required this.onTap,
    this.text,
    this.state = ButtonStateEnum.fill,
  });
}

class SnackbarWidget {
  static void closeSnackbar() {
    _previousEntry?.remove();
    _previousEntry = null;
  }

  static void show({
    required String title,
    String? subTitle,
    Duration duration = const Duration(seconds: 3),
    required OverlayState overlayState,
    SnackbarButtonModel? button,
    SnackbarStatus status = SnackbarStatus.normal,
  }) {
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        final colorTheme = context.colorTheme;
        final textTheme = context.textTheme;

        return _AppFloatingSnackBarWidget(
          onDismissed: () {
            overlayEntry.remove();
            _previousEntry = null;
          },
          borderRadius: BorderRadius.circular(16),
          forwardAnimationDuration: const Duration(milliseconds: 300),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          displayDuration: duration,
          forwardCurve: Curves.easeIn,
          reverseCurve: Curves.easeOut,
          dismissDirection: DismissDirection.up,
          snackBarPosition: SnackbarPosition.TOP,
          margin: const EdgeInsets.only(left: 16, right: 16),
          isDismissible: true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(color: colorTheme.revertBasicColor),
            clipBehavior: Clip.none,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Builder(builder: (context) {
                        switch (status) {
                          case SnackbarStatus.error:
                            return Assets.icons.alertDiamond.svg(
                              colorFilter: ColorFilter.mode(colorTheme.redColor, BlendMode.srcIn),
                              height: 32,
                            );
                          case SnackbarStatus.warning:
                            return Assets.icons.alert.svg(
                              colorFilter: ColorFilter.mode(colorTheme.yellowColor, BlendMode.srcIn),
                              height: 32,
                            );
                          case SnackbarStatus.access:
                            return Assets.icons.tickDouble.svg(
                              colorFilter: ColorFilter.mode(colorTheme.greenColor, BlendMode.srcIn),
                              height: 32,
                            );

                          case SnackbarStatus.info:
                            return Assets.icons.informationSquare.svg(
                              colorFilter: ColorFilter.mode(colorTheme.revertTextColor, BlendMode.srcIn),
                              height: 32,
                            );

                          default:
                            return const SizedBox();
                        }
                      }),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: textTheme.semi16.copyWith(
                              color: colorTheme.revertTextColor,
                            ),
                          ),
                          if (subTitle != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                subTitle,
                                style: textTheme.semi14.copyWith(color: colorTheme.textGrayColor),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (button != null)
                  ButtonWidget(
                    onTap: () {
                      closeSnackbar();
                      button.onTap();
                    },
                    padding: const EdgeInsets.only(top: 16),
                    text: button.text ?? 'Ок',
                    state: button.state,
                  )
              ],
            ),
          ),
        );
      },
    );

    if (_previousEntry?.mounted == true) closeSnackbar();
    overlayState.insert(overlayEntry);
    _previousEntry = overlayEntry;
  }
}

class _AppFloatingSnackBarWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final Duration forwardAnimationDuration;
  final Duration reverseAnimationDuration;
  final Duration displayDuration;
  final Curve forwardCurve;
  final Curve reverseCurve;
  final bool isDismissible;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final DismissDirection dismissDirection;
  final SnackbarPosition snackBarPosition;

  const _AppFloatingSnackBarWidget({
    required this.child,
    required this.onDismissed,
    required this.forwardAnimationDuration,
    required this.reverseAnimationDuration,
    required this.displayDuration,
    required this.forwardCurve,
    required this.reverseCurve,
    required this.margin,
    required this.dismissDirection,
    required this.snackBarPosition,
    required this.borderRadius,
    this.isDismissible = false,
  });

  @override
  _AppFloatingSnackBarState createState() => _AppFloatingSnackBarState();
}

class _AppFloatingSnackBarState extends State<_AppFloatingSnackBarWidget> with SingleTickerProviderStateMixin {
  late final Animation<Offset> _offsetAnimation;
  late final AnimationController _animationController;
  late final Tween<Offset> _offsetTween;

  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.forwardAnimationDuration,
      reverseDuration: widget.reverseAnimationDuration,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _timer = Timer(
              widget.displayDuration,
              () {
                if (mounted) {
                  _animationController.reverse();
                }
              },
            );
          }

          if (status == AnimationStatus.dismissed) {
            _timer?.cancel();
            widget.onDismissed.call();
          }
        },
      );

    if (SnackbarPosition.BOTTOM == widget.snackBarPosition) {
      _offsetTween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    } else if ((SnackbarPosition.TOP == widget.snackBarPosition)) {
      _offsetTween = Tween(begin: const Offset(0, -1), end: Offset.zero);
    }
    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.forwardCurve,
        reverseCurve: widget.reverseCurve,
      ),
    );

    if (mounted) _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.snackBarPosition == SnackbarPosition.TOP ? widget.margin.top : null,
      bottom: widget.snackBarPosition == SnackbarPosition.BOTTOM ? widget.margin.bottom : null,
      left: widget.margin.left,
      right: widget.margin.right,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SafeArea(
          child: widget.isDismissible
              ? Dismissible(
                  key: UniqueKey(),
                  direction: widget.dismissDirection,
                  dismissThresholds: {widget.dismissDirection: 0.2},
                  confirmDismiss: (direction) async {
                    if (mounted) {
                      if (direction == widget.dismissDirection) {
                        await _animationController.reverse();
                      } else {
                        _animationController.reset();
                      }
                    }
                    return false;
                  },
                  child: ClipRRect(
                    borderRadius: widget.borderRadius,
                    child: Material(
                      child: widget.child,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: Material(
                    borderRadius: widget.borderRadius,
                    child: widget.child,
                  ),
                ),
        ),
      ),
    );
  }
}
