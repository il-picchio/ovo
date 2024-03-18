part of 'questionnaire_bloc.dart';

sealed class QuestionnaireEvent {
  const QuestionnaireEvent();
}

class QuestionnaireLoaderEvent extends QuestionnaireEvent {}

class QuestionnaireLoadedEvent extends QuestionnaireEvent {}

class QuestionnaireNextQuestionEvent extends QuestionnaireEvent {
  final String id;
  final int idx;

  const QuestionnaireNextQuestionEvent({required this.idx, required this.id });
}

class QuestionnairePreviousQuestionEvent extends QuestionnaireEvent {
  final int idx;

  const QuestionnairePreviousQuestionEvent({ required this.idx });
}
