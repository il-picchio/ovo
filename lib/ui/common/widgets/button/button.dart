import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ovo/core/theme/elements/colors.dart';

part 'custom_cupertino_button.dart';
part 'ios_button.dart';
part 'android_button.dart';
part 'button_type.dart';

class AdaptiveButton extends StatelessWidget {
  final ButtonType type;
  final Widget child;
  final void Function() onPressed;
  final double? minSize;

  const AdaptiveButton(
      {super.key,
      required this.type,
      required this.onPressed,
      required this.child,
      this.minSize});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IOSButton(
            type: type, onPressed: onPressed, minSize: minSize, child: child)
        : AndroidButton(type: type, onPressed: onPressed, child: child);
  }
}
