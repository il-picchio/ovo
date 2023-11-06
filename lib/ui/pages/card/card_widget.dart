import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = Theme.of(context).extension<BrandColors>()!.gradient;

    return Container(
      width: 20,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        gradient: gradient,
      ),
    );
  }
}
