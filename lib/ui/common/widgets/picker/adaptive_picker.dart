import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_down_button/pull_down_button.dart';

part 'android_picker.dart';
part 'cupertino_picker.dart';
part 'picker_item.dart';

class AdaptivePicker<T> extends StatelessWidget {
  final Iterable<PickerItem<T>> items;
  final T selectedId;
  final bool showIcon;
  final void Function(PickerItem<T>?) onChanged;

  const AdaptivePicker(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.selectedId,
      this.showIcon = true}) : assert(selectedId != null);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AndroidPicker(items: items, selectedId: selectedId, showIcon: showIcon, onChanged: onChanged)
        : CupertinoPicker(items: items, selectedId: selectedId, showIcon: showIcon, onChanged: onChanged);
  }
}
