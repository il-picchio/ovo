import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/common/widgets/currency_picker/currency_picker.dart';
import 'package:ovo/ui/common/widgets/text_field.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisInvestAmount extends StatefulWidget {
  const WealthAnalysisInvestAmount({super.key});

  @override
  State<WealthAnalysisInvestAmount> createState() =>
      _WealthAnalysisInvestAmountState();
}

class _WealthAnalysisInvestAmountState extends State<WealthAnalysisInvestAmount> {
  final TextEditingController controller = TextEditingController();

  bool hasError = false;

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
          'How much you want to invest?',
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Brief description',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              Flexible(flex: 2, child: CurrencyPicker(selectedId: 'CHF', onChanged: (a)=> print(a))),
              SizedBox(width: 15,),
              Flexible(
                flex: 3,
                child: AdaptiveTextField(
                  placeholder: '1000.00',
                  controller: controller,
                  textAlign: TextAlign.center,
                  inputType: const TextInputType.numberWithOptions(decimal: true),
                  onTapOutside: (evt) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  autofocus: true,
                  error: hasError ? 'Inputted value is not a valid number' : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () {
            try {
              final declaredWealth =
                  double.parse(controller.text.replaceAll(',', '.'));
              context.read<WealthAnalysisBloc>().add(
                  WealthAnalysisDeclaredWealthEvent(
                      declaredWealth: declaredWealth));
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
      ],
    );
  }
}
