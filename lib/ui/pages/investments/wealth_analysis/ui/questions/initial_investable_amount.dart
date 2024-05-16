import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/base_widgets/multiple_investable_amount.dart';

class WealthAnalysisInitialInvestAmount extends StatelessWidget {
  static const QuestionId id = QuestionId.investAmount;
  const WealthAnalysisInitialInvestAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return MultipleInvestableAmounts(
      title: 'How much you want to invest initially?',
      subtitle:
          'This is only a lump sum investment, will be done as soon as possible and won`t be repeated',
      onBackButtonPressed: () {
        context.read<WealthAnalysisBloc>().add(
              const WealthAnalysisPreviousStepEvent(
                  currentStep: WealthAnalysisInitialInvestAmount.id),
            );
      },
      onNextButtonPressed: (value) {
        context.read<WealthAnalysisBloc>().add(
              WealthAnalysisInitialInvestEvent(initialInvestment: value),
            );
      },
    );
  }
}
