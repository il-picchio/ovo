import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/common/widgets/list_tile.dart';
import 'package:ovo/ui/pages/investments/kyc/bloc/questionnaire_bloc.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final int idx;

  const QuestionWidget({super.key, required this.question, required this.idx});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<QuestionnaireBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Text(
            question.question,
            style: theme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ...question.answers.mapIndexed(
          (index, answer) => AdaptiveListTile(
            onTap: () {
              bloc.add(QuestionnaireNextQuestionEvent(idx: idx, id: answer.id));
            },
            iosLeadingSize: 35.0,
            iosPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            leading: CircleAvatar(
              backgroundColor: theme.extension<BrandColors>()!.tertiary,
              child: Text((index + 1).toString()),
            ),
            title: Text(
              answer.text,
              style: theme.textTheme.bodyMedium,
              maxLines: 5,
            ),
          ),
        ),
        if (idx != 0)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AdaptiveButton(
              type: ButtonType.text,
              onPressed: () {
                bloc.add(QuestionnairePreviousQuestionEvent(idx: idx));
              },
              child: Text('Previous question'),
            ),
          )
      ],
    );
  }
}
