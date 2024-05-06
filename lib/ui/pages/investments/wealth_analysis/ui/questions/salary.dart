import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/common/widgets/text_field.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisSalary extends StatefulWidget {
  const WealthAnalysisSalary({super.key});

  @override
  State<WealthAnalysisSalary> createState() =>
      _WealthAnalysisSalaryState();
}

class _WealthAnalysisSalaryState extends State<WealthAnalysisSalary> {
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
          'How much do you earn per year?',
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Consider all you earning, such as your salary, any rent property, and some other examples',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: AdaptiveTextField(
            onChanged: (a) {},
            placeholder: '80000.00',
            prefix: const Text('CHF'),
            controller: controller,
            textAlign: TextAlign.center,
            inputType: const TextInputType.numberWithOptions(decimal: true),
            onTapOutside: (evt) => FocusManager.instance.primaryFocus?.unfocus(),
            autofocus: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () {
            try {
              final salary = double.parse(controller.text.replaceAll(',', '.'));
              context.read<WealthAnalysisBloc>().add(
                  WealthAnalysisDeclaredSalaryEvent(declaredSalary: salary));
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
              .add(const WealthAnalysisPreviousStepEvent(currentStep: 2)),
          child: Text('Back'),
        ),
      ],
    );
  }
}
