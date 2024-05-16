import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/base_widgets/multiple_investable_amount.dart';

class WealthAnalysisRecurringInvestmentAmount extends StatelessWidget {
  static const QuestionId id = QuestionId.regularInvestAmount;
  const WealthAnalysisRecurringInvestmentAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return MultipleInvestableAmounts(
      title: 'How much you want to invest periodically?',
      subtitle: 'This is the amount you will invest each month',
      onBackButtonPressed: () => context.read<WealthAnalysisBloc>().add(
          const WealthAnalysisPreviousStepEvent(
              currentStep: WealthAnalysisRecurringInvestmentAmount.id)),
      onNextButtonPressed: (value) => context
          .read<WealthAnalysisBloc>()
          .add(WealthAnalysisRecurringInvestEvent(recurringInvestment: value)),
    );
  }
}
