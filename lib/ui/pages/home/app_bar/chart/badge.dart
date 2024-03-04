import 'package:flutter/material.dart';
import 'package:ovo/core/theme/elements/colors.dart';

class ChartBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;

  const ChartBadge(
      {super.key, required this.icon, required this.text, this.size = 45.0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Tooltip(
      message: text,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.surfaceTint),
          shape: BoxShape.circle,
          gradient: theme.extension<BrandColors>()!.gradient,
        ),
        child: Icon(
          icon,
          size: (size - 25),
          color: Colors.white,
        ),
      ),
    );
  }
}
