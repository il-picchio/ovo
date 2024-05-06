part of 'wealth_analysis_bloc.dart';

sealed class WealthAnalysisState {
  const WealthAnalysisState();
}

class WealthAnalysisDescriptionState extends WealthAnalysisState {}

enum QuestionId {
  investFrequency,
  investAmount,
  regularInvestAmount,
  liquidableFunds,
  salary,
  spending
}

class WealthAnalysisQuestionState extends WealthAnalysisState {
  final QuestionId id;
  const WealthAnalysisQuestionState({ required this.id });
}