import 'package:flutter/material.dart';
import 'package:ovo/ui/common/widgets/pie_chart/pie_chart.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String description;
  final Iterable<SinglePieChartData> data;

  const InvestmentCard(
      {super.key,
      required this.title,
      required this.description,
      required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        children: [
          Text(
            title,
            style: theme.textTheme.displayLarge,
          ),
          Text(
            description,
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
