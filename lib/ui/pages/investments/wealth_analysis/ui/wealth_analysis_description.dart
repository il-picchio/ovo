import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/wealth_analysis_skip.dart';

class WealthAnalysisDescription extends StatelessWidget {
  const WealthAnalysisDescription({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: SingleChildScrollView(
              child: Text('Some text'),
            ),
          ),
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () => context
              .read<WealthAnalysisBloc>()
              .add(const WealthAnalysisDescriptionReadEvent()),
          child: Text('Let\'s start'),
        ),
        AdaptiveButton(
          type: ButtonType.text,
          onPressed: () async {
            final bottomSheetResult = await showModalBottomSheet<bool>(
              context: context,
              builder: (context) => const WealthAnalysisSkipModal(),
            );
            if (bottomSheetResult == null ||
                !bottomSheetResult ||
                !context.mounted) {
              return;
            }
            Navigator.of(context).popAndPushNamed('');
          },
          child: Text('Skip'),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
