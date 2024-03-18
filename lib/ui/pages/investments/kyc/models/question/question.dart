import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ovo/ui/pages/investments/kyc/models/answer/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {

  factory Question({
    required String id,
    required String question,
    required Iterable<Answer> answers
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}