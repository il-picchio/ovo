import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/adaptive_text_field/adaptive_text_field.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisLiquidableFunds extends StatefulWidget {
  static const QuestionId id = QuestionId.liquidableFunds;
  const WealthAnalysisLiquidableFunds({super.key});

  @override
  State<WealthAnalysisLiquidableFunds> createState() =>
      _WealthAnalysisInvestAmountState();
}

class _WealthAnalysisInvestAmountState
    extends State<WealthAnalysisLiquidableFunds> {
  final TextEditingController controller =
      TextEditingController.fromValue(const TextEditingValue(text: '0.00'));

  bool hasError = false;

  @override
  void initState() {
    controller.selection = TextSelection(
        baseOffset: 0, extentOffset: controller.value.text.length);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'Do you have assets to liquidate?',
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'With other providers that you want to liquidate to invest with us',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: AdaptiveTextField(
            onChanged: (a) {},
            placeholder: '100000.00',
            prefix: const Text('CHF'),
            controller: controller,
            textAlign: TextAlign.center,
            inputType: const TextInputType.numberWithOptions(decimal: true),
            onTapOutside: (evt) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            autofocus: true,
            hasError: hasError,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () {
            try {
              final liquidableFunds =
                  double.parse(controller.text.replaceAll(',', '.'));
              context.read<WealthAnalysisBloc>().add(
                  WealthAnalysisLiquidableFundsEvent(
                      liquidableFunds: liquidableFunds));
            } on FormatException {
              setState(() {
                hasError = true;
              });
            } catch (e) {
              setState(() {
                hasError = true;
              });
            }
          },
          child: Text('Proceed'),
        ),
        AdaptiveButton(
          type: ButtonType.text,
          onPressed: () => context
              .read<WealthAnalysisBloc>()
              .add(const WealthAnalysisPreviousStepEvent(currentStep: WealthAnalysisLiquidableFunds.id)),
          child: Text('Back'),
        )
      ],
    );
  }
}
