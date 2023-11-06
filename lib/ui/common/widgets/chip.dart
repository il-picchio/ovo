import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

class Chip extends StatelessWidget {
  const Chip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        gradient: Theme.of(context).extension<BrandColors>()!.gradient
      ),
    );
  }
}