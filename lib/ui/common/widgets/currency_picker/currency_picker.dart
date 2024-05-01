import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/models/currency.dart';
import 'package:ovo/ui/common/widgets/picker/adaptive_picker.dart';

class CurrencyPicker extends StatelessWidget {
  final String selectedId;
  static const Map<String, String> _pictures = {
    'CHF': 'assets/flags/flag_ch.svg',
    'EUR': 'assets/flags/flag_eu.svg',
    'USD': 'assets/flags/flag_usa.svg',
  };

  final void Function(PickerItem<String>?) onChanged;

  const CurrencyPicker(
      {super.key, required this.selectedId, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AdaptivePicker(
      showIcon: false,
      items: Currency.values.map((e) {
        final picture = _pictures[e.id];
        return PickerItem(
            id: e.id,
            label: e.id,
            leading: picture != null
                ? ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(1000.0)),
                    child: SizedBox(
                      child: SvgPicture.asset(
                        picture,
                        clipBehavior: Clip.antiAlias,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Icon(FontAwesomeIcons.question));
      }),
      selectedId: selectedId,
      onChanged: onChanged,
    );
  }
}
