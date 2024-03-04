import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/kyc/cubit/questions_cubit.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/question_container.dart';

class KnowYourCustomer extends StatelessWidget {
  const KnowYourCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Background(
      decorations: Decorations.investments(context),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: BlocProvider(
                  create: (context) => QuestionsCubit(context: context),
                  child: const QuestionContainer(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
