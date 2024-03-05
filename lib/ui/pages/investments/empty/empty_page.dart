import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/empty/invest_button.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          'Motivation text',
          style: theme.textTheme.bodyMedium,
        ),
        TextButton(onPressed: () {}, child: Text('Understand more')),
        SizedBox(
          height: 50,
        ),
        InvestButton()
      ],
    );
  }
}
