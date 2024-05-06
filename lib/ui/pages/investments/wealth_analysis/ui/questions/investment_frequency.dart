import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/ui/common/widgets/picker/adaptive_picker.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/investment_type.dart';

class InvestmentFrequency extends StatelessWidget {
  const InvestmentFrequency({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<WealthAnalysisBloc>();

    return Column(children: [
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
          items: InvestmentType.values.map(
              (e) => PickerItem(id: e, label: 'I would like to invest $e')),
          onChanged: (e) {
            if (e != null) {
              bloc.add(WealthAnalysisInvestmentFrequencyEvent(type: e.id));
            }
          },
          selectedId: bloc.userWealth.investmentType)
    ]);
  }
}
