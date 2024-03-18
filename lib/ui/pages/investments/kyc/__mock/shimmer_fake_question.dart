import 'package:ovo/ui/pages/investments/kyc/models/answer/answer.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';

final shimmerFakeQuestion = Question(
    id: 'q1',
    question: 'I would enjoy exploring investment opportunities for my money.',
    answers: const [
      Answer(id: 'a11', text: 'I strongly agree'),
      Answer(id: 'a12', text: 'I tend to agree'),
      Answer(id: 'a13', text: 'In between'),
      Answer(id: 'a14', text: 'I tend to disagree'),
      Answer(id: 'a15', text: 'I strongly disagree'),
    ]);
