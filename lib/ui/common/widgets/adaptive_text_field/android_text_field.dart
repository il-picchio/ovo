import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo/core/theme/elements/colors.dart';

class AndroidTextField extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final TextInputType? inputType;
  final int maxLines;
  final TextAlign textAlign;
  final bool autofocus;
  final bool hasError;
  final void Function(String) onChanged;
  final Widget? prefix;
  final String? placeholder;
  final List<TextInputFormatter>? inputFormatters;

  const AndroidTextField(
      {super.key,
      required this.onChanged,
      this.inputType,
      int? maxLines,
      this.controller,
      TextAlign? textAlign,
      this.onTap,
      this.onTapOutside,
      bool? autofocus,
      this.prefix,
      this.hasError = false,
      this.placeholder,
      this.inputFormatters})
      : maxLines = maxLines ?? 1,
        textAlign = textAlign ?? TextAlign.start,
        autofocus = autofocus ?? false;

  @override
  Widget build(BuildContext context) {
    final errorColor = hasError
        ? Theme.of(context).extension<BrandColors>()!.errorColor
        : null;
    final decoration = errorColor != null
        ? UnderlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 2),
          )
        : null;

    return TextField(
      cursorColor: errorColor,
      decoration: InputDecoration(
        enabledBorder: decoration,
        focusedBorder: decoration,
        prefix: prefix,
        hintText: placeholder,
      ),
      inputFormatters: inputFormatters,
      keyboardType: inputType,
      controller: controller,
      onTap: onTap,
      onTapOutside:
          onTapOutside ?? (pd) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: maxLines,
      textAlign: textAlign,
      autofocus: autofocus,
    );
  }
}
