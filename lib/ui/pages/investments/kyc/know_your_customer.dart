import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/kyc/cubit/questions_cubit.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/question_container.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/questions_result.dart';

class KnowYourCustomer extends StatelessWidget {
  const KnowYourCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsCubit(context: context),
      child: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Text('Know your customer'),
              actions: [
                if (state.step != state.maxSteps)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(FontAwesomeIcons.xmark),
                  ),
              ],
            ),
            body: Background(
              decorations: Decorations.investments(context),
              child: state.step == state.maxSteps
                  ? const QuestionsResult()
                  : const QuestionContainer(),
            ),
          );
        },
      ),
    );
  }
}
