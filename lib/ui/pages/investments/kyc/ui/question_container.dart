import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/question.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/shimmer_question.dart';

class QuestionContainer extends StatelessWidget {
  final Question? question;
  final int idx;

  const QuestionContainer(
      {super.key, required this.question, required this.idx});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Risk assessment',
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            'Answer honestly',
            style: theme.textTheme.bodySmall,
          ),
          Expanded(
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.decelerate,
                switchOutCurve: Curves.fastOutSlowIn,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  elevation: 20,
                  key: ValueKey(question?.id),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: question != null
                        ? QuestionWidget(question: question!, idx: idx)
                        : const ShimmerQuestion(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
