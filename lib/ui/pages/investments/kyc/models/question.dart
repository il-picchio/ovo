class Answer {
  final int points;
  final String text;

  const Answer({required this.points, required this.text});
}

class Question {
  final String question;
  final Iterable<Answer> answers;

  const Question({required this.question, required this.answers});
}
