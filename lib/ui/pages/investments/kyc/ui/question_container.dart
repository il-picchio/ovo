import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/ui/pages/investments/kyc/cubit/questions_cubit.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final cubit = context.read<QuestionsCubit>();
    final state = context.watch<QuestionsCubit>().state;

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
                key: ValueKey(state.step),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Text(
                          cubit.getQuestion(state.step).question,
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ...cubit.getQuestion(state.step).answers.mapIndexed(
                            (index, answer) => ListTile(
                              onTap: () {
                                cubit.add(points: answer.points);
                              },
                              leading: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color:
                                      theme.extension<BrandColors>()!.tertiary,
                                  shape: BoxShape.circle,
                                ),
                                child: Text((index + 1).toString()),
                              ),
                              title: Text(
                                answer.text,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                      if (state.step != 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextButton(
                            onPressed: () {
                              cubit.back();
                            },
                            child: Text('Previous question'),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
