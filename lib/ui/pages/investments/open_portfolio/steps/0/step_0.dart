import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/0/question_container.dart';

class PortfolioOpenStep0 extends StatelessWidget {
  final void Function() onProceed;
  final void Function(double) onProgress;

  const PortfolioOpenStep0({super.key, required this.onProceed, required this.onProgress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: QuestionContainer(
                onFinish: (p0) => onProceed(),
                onProgress: (p0) => onProgress(p0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
