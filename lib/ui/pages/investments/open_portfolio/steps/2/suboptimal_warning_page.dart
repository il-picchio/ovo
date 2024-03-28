import 'package:flutter/material.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';

class SuboptimalInvestmentPage extends StatelessWidget {
  const SuboptimalInvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Warning',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(thickness: 0.5,),
          ),
          Expanded(
            child: Center(
              child: Text(
                'You are choosing a portfolio with a level of risk lower than yours. This is totally ok, but it means that you might be not satsfied with returns. You can completely customize your portfolio in next step anyway',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AdaptiveButton(type: ButtonType.elevated, onPressed: () => Navigator.of(context).pop(true), child: Text('Ok')),
          SizedBox(height: 15,),
          AdaptiveButton(type: ButtonType.text, onPressed: () => Navigator.of(context).pop(false), child: Text('Cancel'))
        ],
      ),
    );
  }
}
