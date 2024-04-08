import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/question.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/shimmer_question.dart';

class QuestionContainer extends StatelessWidget {
  final Question? question;
  final int idx;
  final double progress;

  const QuestionContainer(
      {super.key,
      required this.question,
      required this.idx,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 0, end: progress),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              color: Colors.indigo.shade100,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
        ),
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
    );
  }
}
