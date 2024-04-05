import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/pages/investments/kyc/bloc/questionnaire_bloc.dart';

class QuestionnaireError extends StatelessWidget {
  const QuestionnaireError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: LinearProgressIndicator(
            value: 0,
            color: Colors.indigo.shade100,
            backgroundColor: Colors.grey.shade200,
          ),
        ),
        const Expanded(child: SizedBox()),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 40.0),
          elevation: 20,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'An error occurred',
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Description',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                AdaptiveButton(
                    type: ButtonType.outlined,
                    onPressed: () => context
                        .read<QuestionnaireBloc>()
                        .add(QuestionnaireErrorEvent()),
                    child: Text('Reload'))
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
