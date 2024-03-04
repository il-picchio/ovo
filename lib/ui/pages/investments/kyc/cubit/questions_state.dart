part of 'questions_cubit.dart';

class QuestionsState {
  QuestionsState({required this.points, required this.step});

  final Map<int, int> points;

  int step;

  copyWith({ Map<int, int>? points, int? step }) {
    return QuestionsState(
      points: points ?? this.points, 
      step: step ?? this.step
    );
  }

  factory QuestionsState.initial() => QuestionsState(points: {}, step: 0);
}
