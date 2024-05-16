import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class FooterButtons extends StatelessWidget {
  final void Function() onBackPressed;
  final void Function() onProceedPressed;

  const FooterButtons(
      {super.key, required this.onBackPressed, required this.onProceedPressed});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WealthAnalysisBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        if (bloc.canGoBack())
          AdaptiveButton(
            type: ButtonType.text,
            onPressed: onBackPressed,
            child: Text('Back'),
          ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: onProceedPressed,
          child: Text('Proceed'),
        )
      ],
    );
  }
}
