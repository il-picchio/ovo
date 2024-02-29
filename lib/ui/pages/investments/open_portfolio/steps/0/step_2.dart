import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PortfolioOpenStep2 extends StatelessWidget {

  const PortfolioOpenStep2({ super.key });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text('Our portfolios', style: theme.textTheme.headlineMedium,),
        Row(
          children: [
            Card(
              child: Column(children: [],),
            )
          ],
        )
      ],
    );
  }
 }