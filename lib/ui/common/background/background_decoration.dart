import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<BrandColors>()!;
    return Container(
      width: width,
      height: height / 4,
      decoration: BoxDecoration(
        color: theme.tertiary.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(width)),
      ),
    );
  }
}
