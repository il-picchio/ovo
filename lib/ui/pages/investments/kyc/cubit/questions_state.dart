part of 'questions_cubit.dart';

@immutable
class QuestionsState {
  const QuestionsState({required this.points, required this.step});

  final Map<int, int> points;

  final int step;

  final int maxSteps = 13;

  copyWith({ Map<int, int>? points, int? step }) {
    return QuestionsState(
      points: points ?? this.points, 
      step: step ?? this.step,
    );
  }

  factory QuestionsState.initial() => const QuestionsState(points: {}, step: 0);
}
