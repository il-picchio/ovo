import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovo/core/theme/elements/colors.dart';

class AdaptiveTextField extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final TextInputType? inputType;
  final int maxLines;
  final TextAlign textAlign;
  final bool autofocus;
  final String? error;
  final Widget? prefix;
  final String? placeholder;

  const AdaptiveTextField(
      {super.key,
      this.inputType,
      int? maxLines,
      this.controller,
      TextAlign? textAlign,
      this.onTap,
      this.onTapOutside,
      bool? autofocus,
      this.prefix,
      this.error,
      this.placeholder})
      : maxLines = maxLines ?? 1,
        textAlign = textAlign ?? TextAlign.start,
        autofocus = autofocus ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeExtension = theme.extension<BrandColors>()!;
    final textStyle = theme.textTheme.bodySmall!
        .copyWith(color: themeExtension.secondaryTextColor);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Platform.isIOS
            ? CupertinoTextField(
                placeholder: placeholder,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: prefix,
                ),
                keyboardType: inputType,
                controller: controller,
                onTap: onTap,
                onTapOutside: onTapOutside,
                maxLines: maxLines,
                textAlign: textAlign,
                autofocus: autofocus,
              )
            : TextField(
                decoration: prefix != null || placeholder != null
                    ? InputDecoration(
                        prefix: prefix,
                        hintText: placeholder,)
                    : const InputDecoration(),
                keyboardType: inputType,
                controller: controller,
                onTap: onTap,
                onTapOutside: onTapOutside,
                maxLines: maxLines,
                textAlign: textAlign,
                autofocus: autofocus,
              ),
        if (error != null) ...[
          const SizedBox(
            height: 5,
          ),
          Text(
            error!,
            style: textStyle,
          ),
        ]
      ],
    );
  }
}
