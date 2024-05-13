import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/adaptive_text_field/adaptive_text_field.dart';

class SearchMovement extends StatelessWidget {
  final TextEditingController controller;
  final GestureTapCallback onTap;
  final TapRegionCallback onTapOutside;

  const SearchMovement(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AdaptiveTextField(
              onChanged: (a) {},
              controller: controller,
              onTap: onTap,
              onTapOutside: onTapOutside,
            ),
          ))
        ],
      ),
    );
  }
}
