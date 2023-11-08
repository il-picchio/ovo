import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/ui/pages/investments/portfolio/investment_weight/circle/painter.dart';

class Circle extends StatelessWidget {
  final bool isPositive;
  final double percent;

  const Circle({super.key, required this.isPositive, required this.percent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BrandColors>()!;

    return CustomPaint(
      painter: CirclePainter(
          color: isPositive ? theme.positiveAmounts : theme.negativeAmounts,
          percent: percent,
      ),
      size: Size.fromRadius(25),
    );
  }
}
