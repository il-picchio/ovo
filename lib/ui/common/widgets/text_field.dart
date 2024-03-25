import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdaptiveTextField extends StatelessWidget {
  final TextEditingController controller;
  final GestureTapCallback onTap;
  final TapRegionCallback onTapOutside;

  const AdaptiveTextField(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            onTap: onTap,
            onTapOutside: onTapOutside,
          )
        : TextField(
            controller: controller,
            onTap: onTap,
            onTapOutside: onTapOutside,
          );
  }
}
