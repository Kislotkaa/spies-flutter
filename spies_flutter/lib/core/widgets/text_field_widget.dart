import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/hide_keyboard.dart';

class TextFieldWidget extends StatelessWidget with HideKeyboard {
  const TextFieldWidget({
    super.key,
    this.titleText,
    this.errorText,
    this.titleCenter = false,
    this.type = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.initialValue,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters,
    this.autofocus,
    this.controller,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.autocorrect = true,
    this.focusNode,
    this.onTap,
    this.onEditingComplete,
    this.validator,
    this.enabled = true,
    this.autoFillHints,
  });
  final int maxLines;
  final bool? autofocus;
  final String? autoFillHints;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLength;
  final String? hintText;
  final String? titleText;
  final String? errorText;
  final bool titleCenter;
  final TextInputType type;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final bool autocorrect;
  final bool enabled;
  final bool obscureText;

  final String? Function(String?)? validator;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final Function()? onEditingComplete;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: titleCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              titleText!,
              maxLines: 1,
              style: appTheme.textTheme.bodySemibold12.copyWith(
                color: appTheme.textGrayColor,
              ),
            ),
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUnfocus,
          validator: validator,
          autofillHints: autoFillHints != null ? [autoFillHints!] : null,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          focusNode: focusNode,
          textAlign: textAlign,
          cursorColor: appTheme.textColor,
          autocorrect: autocorrect,
          obscureText: obscureText,
          maxLines: maxLines,
          controller: controller,
          style: appTheme.textTheme.bodySemibold16,
          initialValue: initialValue,
          autofocus: autofocus ?? false,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          keyboardType: type,
          decoration: _getInputDecoration(),
          onChanged: (value) => onChanged?.call(value),
          onSaved: (value) => onSaved?.call(value ?? ''),
          onTapOutside: (_) => hideKeyboard(),
          onEditingComplete: onEditingComplete,
          onTap: onTap,
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: appTheme.textTheme.bodySemibold14.copyWith(color: appTheme.redColor),
            ),
          ),
      ],
    );
  }

  InputDecoration _getInputDecoration() => InputDecoration(
        contentPadding: const EdgeInsets.only(right: 12, left: 12),
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
        hintStyle: appTheme.textTheme.bodySemibold14.copyWith(color: appTheme.textGrayColor),
        labelStyle: appTheme.textTheme.bodySemibold14.copyWith(color: appTheme.textGrayColor),
        errorStyle: appTheme.textTheme.bodyExtrabold14.copyWith(color: appTheme.redColor),
        errorMaxLines: 4,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: appTheme.cardColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: appTheme.cardColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: appTheme.cardColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: appTheme.cardColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: appTheme.textGrayColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: appTheme.textGrayColor,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      );
}
