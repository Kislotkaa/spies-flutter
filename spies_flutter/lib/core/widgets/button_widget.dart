import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cubits/theme_cubit.dart';

enum ButtonStateEnum { fill, outline }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.padding,
    this.height = 50,
    this.isChips = false,
    this.state = ButtonStateEnum.fill,
  });

  final Function() onTap;
  final String text;
  final double height;
  final ButtonStateEnum state;
  final EdgeInsets? padding;
  final bool isChips;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<ThemeCubit>().appTheme;
    final defaultTextStyle = appTheme.textTheme.bodySemibold18;
    final defaultButtnStyle = ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, height)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 32),
      ),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isChips ? 36 : 12),
        ),
      ),
    );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: switch (state) {
          ButtonStateEnum.fill => defaultButtnStyle.copyWith(
              backgroundColor: WidgetStatePropertyAll(appTheme.primaryColor),
              overlayColor: WidgetStatePropertyAll(appTheme.revertBasicColor),
            ),
          ButtonStateEnum.outline => defaultButtnStyle.copyWith(
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              overlayColor: WidgetStatePropertyAll(appTheme.cardColor),
              side: WidgetStatePropertyAll(
                BorderSide(color: appTheme.textGrayColor),
              ),
            ),
        },
        onPressed: onTap,
        child: Text(
          text,
          style: switch (state) {
            ButtonStateEnum.fill => defaultTextStyle.copyWith(
                color: appTheme.alwaysWhiteColor,
              ),
            ButtonStateEnum.outline => defaultTextStyle,
          },
        ),
      ),
    );
  }
}
