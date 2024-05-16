import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisSpending extends StatefulWidget {
  static const QuestionId id = QuestionId.spending;
  const WealthAnalysisSpending({super.key});

  @override
  State<WealthAnalysisSpending> createState() => _WealthAnalysisSpendingState();
}

class _WealthAnalysisSpendingState extends State<WealthAnalysisSpending> {
  final GlobalKey<FormState> _controller = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                key: _controller,
                child: Column(
                  children: [
                    /*
                    AdaptiveFormField(
                      onChange: (p0) {},
                      prefix: 'CHF',
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      autofocus: true,
                      validator: (s) => 'text',
                    ),
                    AdaptiveFormDivider(),
                    AdaptiveFormField(
                      onChange: (p0) {},
                      prefix: 'CHF',
                      inputType: TextInputType.numberWithOptions(decimal: true),
                    )
                    */
                  ],
                ))),
        const SizedBox(
          height: 20,
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () {
            print(_controller.currentState?.validate());
          },
          child: Text('Proceed'),
        ),
        AdaptiveButton(
          type: ButtonType.text,
          onPressed: () => context
              .read<WealthAnalysisBloc>()
              .add(const WealthAnalysisPreviousStepEvent(currentStep: WealthAnalysisSpending.id)),
          child: Text('Back'),
        )
      ],
    );
    ;
  }
}
