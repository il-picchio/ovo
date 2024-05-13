import 'package:flutter/material.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/ui/common/widgets/adaptive_text_field/adaptive_text_field.dart';
import 'package:ovo/ui/common/widgets/currency_picker/currency_picker.dart';
import 'package:ovo/ui/common/widgets/picker/adaptive_picker.dart';

class CurrencyAmountRow extends StatelessWidget {
  final String currency;
  final String? amount;
  final void Function(PickerItem<String>?) onCurrencyChanged;
  final void Function(String) onAmountChanged;
  final String? error;
  final String? amountPlaceholder;
  final bool autofocus;

  const CurrencyAmountRow(
      {super.key,
      required this.currency,
      required this.amount,
      required this.onCurrencyChanged,
      required this.onAmountChanged,
      required this.error,
      this.amountPlaceholder,
      bool? autofocus})
      : autofocus = autofocus ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BrandColors>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(
              flex: 2,
              child: CurrencyPicker(
                selectedId: currency,
                onChanged: onCurrencyChanged,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              flex: 3,
              child: AdaptiveTextField(
                onChanged: onAmountChanged,
                placeholder: amountPlaceholder,
                inputType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                autofocus: autofocus,
                hasError: error != null,
              ),
            ),
          ],
        ),
        if (error != null)
          Flexible(
            child: Text(
              error!,
              style: TextStyle(color: theme.errorColor),
            ),
          ),
      ],
    );
  }
}
