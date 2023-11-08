import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/portfolio/investment_weight/investment_weight.dart';

class PortfolioElement extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double value;
  final double percent;

  const PortfolioElement(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.percent,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {},
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall,
      ),
      trailing: InvestmentWeight(value: value, percent: percent),
    );
  }
}
