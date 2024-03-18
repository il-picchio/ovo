part of 'questionnaire_bloc.dart';

sealed class QuestionnaireState extends Equatable {
  const QuestionnaireState();
}

class QuestionnaireLoaderState extends QuestionnaireState {
  @override
  List<Object?> get props => [];
}

class QuestionnaireLoadedState extends QuestionnaireState {
  final Question question;
  final int idx;
  final int totalQuestions;

  const QuestionnaireLoadedState({ required this.question, required this.idx, required this.totalQuestions }) : super();
  
  @override
  List<Object?> get props => [question];
}

class QuestionnaireErrorState extends QuestionnaireState {
  final String error;

  const QuestionnaireErrorState({ required this.error });

  @override
  List<Object?> get props => [error];
}
