import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/picker/adaptive_picker.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/investment_type.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/base_widgets/footer_buttons.dart';

class InvestmentFrequency extends StatefulWidget {
  static const QuestionId id = QuestionId.investFrequency;
  const InvestmentFrequency({super.key});

  @override
  State<InvestmentFrequency> createState() => _InvestmentFrequencyState();
}

class _InvestmentFrequencyState extends State<InvestmentFrequency> {
  InvestmentType? _type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<WealthAnalysisBloc>();

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        'What\'s the frequency you would like to invest?',
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        'There are multiple strategies, you might want to invest only once, regularly or both',
        style: theme.textTheme.bodySmall,
      ),
      const SizedBox(
        height: 20,
      ),
      AdaptivePicker(
        items: InvestmentType.values
            .map((e) => PickerItem(id: e, label: 'I would like to invest $e')),
        onChanged: (e) {
          if (e != null) {
            _type = e.id;
          }
        },
        selectedId: bloc.userWealth.investmentType,
      ),
      FooterButtons(
        onBackPressed: () => context.read<WealthAnalysisBloc>().add(
              const WealthAnalysisPreviousStepEvent(
                  currentStep: InvestmentFrequency.id),
            ),
        onProceedPressed: () => context.read<WealthAnalysisBloc>().add(
              WealthAnalysisInvestmentFrequencyEvent(type: _type),
            ),
      )
    ]);
  }
}
