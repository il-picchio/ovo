import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovo/ui/common/widgets/adaptive_text_field/android_text_field.dart';
import 'package:ovo/ui/common/widgets/adaptive_text_field/ios_text_field.dart';

class AdaptiveTextField extends StatelessWidget {
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

  const AdaptiveTextField(
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
      this.placeholder})
      : maxLines = maxLines ?? 1,
        textAlign = textAlign ?? TextAlign.start,
        autofocus = autofocus ?? false;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosTextField(
            onChanged: onChanged,
            inputType: inputType,
            maxLines: maxLines,
            controller: controller,
            textAlign: textAlign,
            onTap: onTap,
            onTapOutside: onTapOutside,
            autofocus: autofocus,
            prefix: prefix,
            hasError: hasError,
            placeholder: placeholder,
          )
        : AndroidTextField(
            onChanged: onChanged,
            inputType: inputType,
            maxLines: maxLines,
            controller: controller,
            textAlign: textAlign,
            onTap: onTap,
            onTapOutside: onTapOutside,
            autofocus: autofocus,
            prefix: prefix,
            hasError: hasError,
            placeholder: placeholder,
          );
  }
}
