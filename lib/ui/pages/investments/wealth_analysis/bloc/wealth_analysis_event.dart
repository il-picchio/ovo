part of 'wealth_analysis_bloc.dart';

sealed class WealthAnalysisEvent {
  const WealthAnalysisEvent();
}

class WealthAnalysisDescriptionEvent extends WealthAnalysisEvent {}

class WealthAnalysisDescriptionReadEvent extends WealthAnalysisEvent {
  const WealthAnalysisDescriptionReadEvent();
}

class WealthAnalysisInvestmentFrequencyEvent extends WealthAnalysisEvent {
  final InvestmentType type;

  const WealthAnalysisInvestmentFrequencyEvent({ required this.type });
}

class WealthAnalysisInitialInvestEvent extends WealthAnalysisEvent {
  final List<CurrencyValueMap> initialInvestment;

  const WealthAnalysisInitialInvestEvent({ required this.initialInvestment });
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

