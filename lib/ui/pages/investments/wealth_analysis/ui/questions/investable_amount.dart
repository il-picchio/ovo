import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovo/models/currency.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';
import 'package:ovo/ui/common/widgets/currency_amount_handler.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'How much you want to invest initially?',
          style: theme.textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
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
        Flexible(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: _investmentMap
                        .mapIndexed(
                          (index, e) => FormField(
                            validator: (_) {
                              final amount = _investmentMap[index].value;
                              return amount == null ||
                                      amount.isEmpty ||
                                      double.tryParse(amount) == null
                                  ? 'Please insert a valid amount'
                                  : null;
                            },
                            builder: (state) => CurrencyAmountRow(
                                currency: _investmentMap[index].currency,
                                amount: _investmentMap[index].value,
                                onCurrencyChanged: (currency) {
                                  if (currency == null) return;
                                  _investmentMap[index].currency =
                                      currency.id;
                                },
                                onAmountChanged: (amount) {
                                  _investmentMap[index].value = amount;
                                },
                                amountPlaceholder: '1000.00',
                                error: state.errorText),
                          ),
                        )
                        .toList(growable: false),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AdaptiveButton(
                type: ButtonType.outlined,
                onPressed: () => setState(() => _investmentMap.add(
                    CurrencyValueMap(
                        currency: Currency.chf.id, value: null))),
                child: Text(
                  '+ Add more details',
                  style: TextStyle(fontSize: 12),
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        AdaptiveButton(
          type: ButtonType.text,
          onPressed: () {
            context.read<WealthAnalysisBloc>().add(
                  WealthAnalysisInitialInvestEvent(initialInvestment: [
                    CurrencyValueMap(currency: Currency.chf.id, value: null)
                  ]),
                );
          },
          child: Text('Back'),
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
