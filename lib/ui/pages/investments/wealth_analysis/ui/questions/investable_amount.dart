import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/models/currency.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/common/widgets/currency_picker/currency_picker.dart';
import 'package:ovo/ui/common/widgets/form/adaptive_form.dart';
import 'package:ovo/ui/common/widgets/text_field.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/currency_value_map/currency_value_map.dart';

class WealthAnalysisInitialInvestAmount extends StatefulWidget {
  const WealthAnalysisInitialInvestAmount({super.key});

  @override
  State<WealthAnalysisInitialInvestAmount> createState() =>
      _WealthAnalysisInitialInvestAmountState();
}

class _WealthAnalysisInitialInvestAmountState
    extends State<WealthAnalysisInitialInvestAmount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<CurrencyValueMap> _investmentMap = [
    CurrencyValueMap(currency: Currency.chf.id, value: null)
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'How much you want to invest initially?',
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'This is only a lump sum investment, will be done as soon as possible and won`t be repeated',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._investmentMap.mapIndexed(
                    (index, e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CurrencyPicker(
                            selectedId: _investmentMap[index].currency,
                            onChanged: (a) {
                              if (a != null) {
                                _investmentMap[index].currency = a.id;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          flex: 2,
                          child: AdaptiveTextField(
                            onChanged: (p0) => _investmentMap[index].value = p0,
                            placeholder: '1000.00',
                            inputType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            autofocus: true,
                            hasError: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AdaptiveButton(
                      type: ButtonType.outlined,
                      onPressed: () => setState(() => _investmentMap.add(
                          CurrencyValueMap(
                              currency: Currency.chf.id, value: null))),
                      child: Text('Add more details'))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AdaptiveButton(
          type: ButtonType.elevated,
          onPressed: () {
            final isFormValid = _formKey.currentState?.validate() ?? false;
            if (!isFormValid) {
              HapticFeedback.lightImpact();
              return;
            }
            context.read<WealthAnalysisBloc>().add(
                  WealthAnalysisInitialInvestEvent(
                      initialInvestment: _investmentMap),
                );
          },
          child: Text('Proceed'),
        ),
      ],
    );
  }
}
