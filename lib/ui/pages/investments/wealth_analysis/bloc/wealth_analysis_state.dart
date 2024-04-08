part of 'wealth_analysis_bloc.dart';

sealed class WealthAnalysisState {
  const WealthAnalysisState();
}

class WealthAnalysisDescriptionState extends WealthAnalysisState {}

class WealthAnalysisQuestionState extends WealthAnalysisState {
  final int step;
  const WealthAnalysisQuestionState({ required this.step });
}