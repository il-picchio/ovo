import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionnaireCompleted extends StatelessWidget {
  const QuestionnaireCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Questionnaire completed'),
        Icon(FontAwesomeIcons.checkDouble),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Back to investments'))
      ],
    );
  }
}
