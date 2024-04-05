import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';

import '../bloc/questionnaire_bloc.dart';

class QuestionnaireDescription extends StatelessWidget {
  const QuestionnaireDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<QuestionnaireBloc>();

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
        const Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: SingleChildScrollView(
              child: Text('Some text'),
            ),
          ),
        ),
        AdaptiveButton(
            type: ButtonType.elevated,
            onPressed: () => bloc.add(QuestionnaireLoaderEvent()),
            child: Text('Let\'s start'))
      ],
    );
  }
}
