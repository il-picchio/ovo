import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return !Platform.isIOS
        ? CupertinoTextField(
            decoration: hasError
                ? BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.systemRed,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(5.0))
                : null,
            onChanged: onChanged,
            placeholder: placeholder,
            prefix: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: prefix,
            ),
            keyboardType: inputType,
            controller: controller,
            onTap: onTap,
            onTapOutside: onTapOutside ??
                (pd) => FocusManager.instance.primaryFocus?.unfocus(),
            maxLines: maxLines,
            textAlign: textAlign,
            autofocus: autofocus,
          )
        : TextField(
            cursorColor: hasError ? Colors.red.shade700 : null,
            decoration: InputDecoration(
              enabledBorder: hasError
                  ? UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red.shade700, width: 2))
                  : null,
              focusedBorder: hasError
                  ? UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red.shade700, width: 2))
                  : null,
              prefix: prefix,
              hintText: placeholder,
            ),
            keyboardType: inputType,
            controller: controller,
            onTap: onTap,
            onTapOutside: onTapOutside ??
                (pd) => FocusManager.instance.primaryFocus?.unfocus(),
            maxLines: maxLines,
            textAlign: textAlign,
            autofocus: autofocus,
          );
  }
}
