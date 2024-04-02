import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveListTile extends StatelessWidget {
  final Widget title;
  final void Function()? onTap;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets? iosPadding;
  final double? iosLeadingSize;

  const AdaptiveListTile(
      {super.key,
      required this.title,
      this.onTap,
      this.leading,
      this.trailing,
      this.iosLeadingSize,
      this.iosPadding});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoListTile(
            title: title,
            onTap: onTap,
            leading: leading,
            trailing: trailing,
            padding: iosPadding,
            leadingSize: iosLeadingSize ?? 28.0,
          )
        : ListTile(
            title: title,
            onTap: onTap,
            leading: leading,
            trailing: trailing,
          );
  }
}
