import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/portfolio/investment_weight/circle/circle.dart';

class InvestmentWeight extends StatelessWidget {
  final double value;
  final double percent;

  const InvestmentWeight({super.key, required this.value, required this.percent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Circle(isPositive: value >= 0, percent: percent),
        Text('${percent.toStringAsFixed(0)}%', style: theme.textTheme.labelMedium,)
      ],
    );
  }
}