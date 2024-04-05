import 'dart:async';

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
  final List<String> _answerList = [];
  final List<Question> _questions = [];
  late Completer<Iterable<Question>> _questionnaireLoader;

  QuestionnaireBloc({required this.apiService, required this.context})
      : super(QuestionnaireLoaderState()) {
    on<QuestionnaireEvent>((event, emit) async {
      if (event is QuestionnaireDescriptionEvent) {
        return _preloadQuestionnaire(emit,
            stateToEmit: QuestionnaireDescriptionState());
      } else if (event is QuestionnaireLoaderEvent) {
        return _loadQuestionnaire(emit);
      } else if (event is QuestionnaireNextQuestionEvent) {
        return _nextQuestion(emit, event);
      } else if (event is QuestionnairePreviousQuestionEvent) {
        return _previousQuestion(emit, event);
      } else {
        return _handleError(emit);
      }
    });
  }

  Future<void> _preloadQuestionnaire(Emitter<QuestionnaireState> emit,
      {required QuestionnaireState stateToEmit}) async {
    _questionnaireLoader = Completer<Iterable<Question>>();
    apiService
        .getQuestionnaire()
        .then((value) => _questionnaireLoader.complete(value))
        .catchError(_questionnaireLoader.completeError);
    emit(stateToEmit);
  }

  Future<void> _loadQuestionnaire(Emitter<QuestionnaireState> emit) async {
    print(_questionnaireLoader.isCompleted);
    if (!_questionnaireLoader.isCompleted) {
      emit(QuestionnaireLoaderState());
    }
    try {
      final questions = await _questionnaireLoader.future;
      _questions.addAll(questions);
      emit(QuestionnaireLoadedState(
          question: _questions.first,
          idx: 0,
          totalQuestions: _questions.length));
    } catch (e) {
      emit(QuestionnaireErrorState(error: 'Test'));
    }
  }

  void _nextQuestion(
      Emitter<QuestionnaireState> emit, QuestionnaireNextQuestionEvent event) {
    if (event.idx == _questions.length - 1) {
      emit(QuestionnaireCompletedState());
      return;
    }
    final newIdx = event.idx + 1;
    _answerList.add(event.id);
    emit(QuestionnaireLoadedState(
        question: _questions[newIdx],
        idx: newIdx,
        totalQuestions: _questions.length));
  }

  void _previousQuestion(Emitter<QuestionnaireState> emit,
      QuestionnairePreviousQuestionEvent event) {
    if (event.idx == 0) {
      emit(QuestionnaireErrorState(
          error: 'Requested previous question but index is 0'));
      return;
    }
    _answerList.removeLast();
    final newIdx = event.idx - 1;
    emit(QuestionnaireLoadedState(
        question: _questions[newIdx],
        idx: newIdx,
        totalQuestions: _questions.length));
  }

  void _handleError(Emitter<QuestionnaireState> emit) {
    _preloadQuestionnaire(emit, stateToEmit: QuestionnaireLoaderState());
    add(QuestionnaireLoaderEvent());
  }
}
