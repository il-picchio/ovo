import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/pages/investments/kyc/__mock/questions.dart';

import '../models/question.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final BuildContext context;

  QuestionsCubit({ required this.context }) : super(QuestionsState.initial());

  Question getQuestion(int step) {
    return questions[step];
  }

  void add({required int points}) {
    final Map<int, int> updatedPoints = Map.from(state.points);
    updatedPoints[state.step] = points;

    emit(state.copyWith(points: updatedPoints, step: state.step + 1));
  }

  void back() {
    final Map<int, int> updatedPoints = Map.from(state.points);
    updatedPoints.remove(state.step);
    emit(state.copyWith(points: updatedPoints, step: state.step - 1));
  }
}
