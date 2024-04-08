import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisQuestion2 extends StatelessWidget {
  const WealthAnalysisQuestion2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you already have an emergency fund?',
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Brief description',
          style: theme.textTheme.bodySmall,
        ),
        SizedBox(height: 20,),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () => context
              .read<WealthAnalysisBloc>()
              .add(const WealthAnalysisNextStepEvent(currentStep: 2)),
          child: Text('Proceed'),
        ),
        AdaptiveButton(
          type: ButtonType.text,
          onPressed: () => context
              .read<WealthAnalysisBloc>()
              .add(const WealthAnalysisPreviousStepEvent(currentStep: 2)),
          child: Text('Back'),
        ),
      ],
    );
  }
}
