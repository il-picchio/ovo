part of 'wealth_analysis_bloc.dart';

sealed class WealthAnalysisEvent {
  const WealthAnalysisEvent();
}

class WealthAnalysisDescriptionEvent extends WealthAnalysisEvent {}

class WealthAnalysisDeclaredWealthEvent extends WealthAnalysisEvent {
  final double declaredWealth;

  const WealthAnalysisDeclaredWealthEvent({ required this.declaredWealth });
}

class WealthAnalysisLiquidableFundsEvent extends WealthAnalysisEvent {
  final double liquidableFunds;

  const WealthAnalysisLiquidableFundsEvent({ required this.liquidableFunds });
}

class WealthAnalysisDeclaredSalaryEvent extends WealthAnalysisEvent {
  final double declaredSalary;

  const WealthAnalysisDeclaredSalaryEvent({ required this.declaredSalary });
}

class WealthAnalysisNextStepEvent extends WealthAnalysisEvent {
  final int currentStep;
  
  const WealthAnalysisNextStepEvent({ required this.currentStep });
}

class WealthAnalysisPreviousStepEvent extends WealthAnalysisEvent {
  final int currentStep;

  const WealthAnalysisPreviousStepEvent({ required this.currentStep });
}

