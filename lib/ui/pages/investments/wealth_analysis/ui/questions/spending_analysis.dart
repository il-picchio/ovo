import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/common/widgets/form/adaptive_form.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisSpending extends StatefulWidget {
  const WealthAnalysisSpending({super.key});

  @override
  State<WealthAnalysisSpending> createState() => _WealthAnalysisSpendingState();
}

class _WealthAnalysisSpendingState extends State<WealthAnalysisSpending> {
  final TextEditingController _neededSpendingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _neededSpendingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'Spending analysis?',
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'With other providers that you want to liquidate to invest with us',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
                child: Column(
              children: [
                AdaptiveFormField(
                  label: 'Necessita',
                  prefix: 'CHF',
                  inputType: TextInputType.numberWithOptions(decimal: true),
                ),
                AdaptiveFormDivider(),
                AdaptiveFormField(
                  label: 'Svago',
                  prefix: 'CHF',
                  inputType: TextInputType.numberWithOptions(decimal: true),
                )
              ],
            ))),
        const SizedBox(
          height: 20,
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () {
            print('test');
          },
          child: Text('Proceed'),
        ),
        AdaptiveButton(
          type: ButtonType.text,
          onPressed: () => context
              .read<WealthAnalysisBloc>()
              .add(const WealthAnalysisPreviousStepEvent(currentStep: 1)),
          child: Text('Back'),
        )
      ],
    );
    ;
  }
}
