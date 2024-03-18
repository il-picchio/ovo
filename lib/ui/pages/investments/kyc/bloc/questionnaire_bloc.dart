import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';
import 'package:ovo/ui/pages/investments/kyc/services/questionnaire_api_service.dart';

part 'questionnaire_event.dart';
part 'questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final QuestionnaireApiService apiService;
  final BuildContext context;
  final List<String> answerList = [];
  final List<Question> questions = [];

  QuestionnaireBloc({required this.apiService, required this.context})
      : super(QuestionnaireLoaderState()) {
    on<QuestionnaireEvent>((event, emit) async {
      if (event is QuestionnaireLoaderEvent) {
        return _loadQuestionnaire(emit);
      } else if (event is QuestionnaireNextQuestionEvent) {
        return _nextQuestion(emit, event);
      } else if (event is QuestionnairePreviousQuestionEvent) {
        return _previousQuestion(emit, event);
      }
    });
  }

  Future<void> _loadQuestionnaire(Emitter<QuestionnaireState> emit) async {
    try {
      questions.addAll(await apiService.getQuestionnaire());
      emit(QuestionnaireLoadedState(
          question: questions.first, idx: 0, totalQuestions: questions.length));
    } catch (e) {
      print(e);
      emit(QuestionnaireErrorState(error: 'Test'));
    }
  }

  void _nextQuestion(
      Emitter<QuestionnaireState> emit, QuestionnaireNextQuestionEvent event) {
    if (event.idx == questions.length - 1) {
      print('questionnaire completed $answerList');
      return;
    }
    final newIdx = event.idx + 1;
    print(newIdx);
    answerList.add(event.id);
    emit(QuestionnaireLoadedState(
        question: questions[newIdx],
        idx: newIdx,
        totalQuestions: questions.length));
  }

  void _previousQuestion(Emitter<QuestionnaireState> emit,
      QuestionnairePreviousQuestionEvent event) {
    if (event.idx == 0) {
      emit(QuestionnaireErrorState(
          error: 'Requested previous question but index is 0'));
      return;
    }
    answerList.removeLast();
    final newIdx = event.idx - 1;
    emit(QuestionnaireLoadedState(
        question: questions[newIdx],
        idx: newIdx,
        totalQuestions: questions.length));
  }
}
