import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/kyc/bloc/questionnaire_bloc.dart';
import 'package:ovo/ui/pages/investments/kyc/services/questionnaire_api_service.dart';
import 'package:ovo/ui/pages/investments/kyc/ui/question_container.dart';

class KnowYourCustomer extends StatelessWidget {
  const KnowYourCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionnaireBloc(
        context: context,
        apiService: const QuestionnaireApiService(),
      )..add(QuestionnaireLoaderEvent()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text('Know your customer'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: Background(
          decorations: Decorations.investments(context),
          child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
            builder: (context, state) {
              double progress = 0.0;
              if (state is QuestionnaireLoadedState) {
                progress = state.idx / (state.totalQuestions - 1);
              }
              return Column(
                mainAxisSize: MainAxisSize.max,
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
                  if (state is QuestionnaireLoaderState)
                    QuestionContainer(
                      question: null,
                      idx: 0,
                    )
                  else if (state is QuestionnaireLoadedState)
                    QuestionContainer(
                      question: state.question,
                      idx: state.idx,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
