import 'dart:convert';

import 'package:ovo/ui/pages/investments/kyc/__mock/questions.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';

class QuestionnaireApiService {
  const QuestionnaireApiService();

  Future<Iterable<Question>> getQuestionnaire() async {
    await Future.delayed(const Duration(seconds: 2));
    final Iterable data = jsonDecode(mockquestionnaire);
    final questionnaire = List<Question>.from(data.map((e) => Question.fromJson(e)));
    return questionnaire;
  }
}
