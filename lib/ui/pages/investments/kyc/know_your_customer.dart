import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          context: context, apiService: const QuestionnaireApiService())
        ..add(QuestionnaireLoaderEvent()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text('Know your customer'),
          actions: [
            // Add your actions here if needed
          ],
        ),
        body: Background(
          decorations: Decorations.investments(context),
          child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
            builder: (context, state) {
              return state is QuestionnaireLoaderState
                  ? QuestionContainer(question: null, idx: 0,)
                  : state is QuestionnaireLoadedState
                      ? QuestionContainer(question: state.question, idx: state.idx,)
                      : SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
