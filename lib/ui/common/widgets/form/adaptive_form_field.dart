part of 'adaptive_form.dart';

class AdaptiveFormField extends StatelessWidget {
  final String label;
  final String? prefix;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final String? placeholder;

  const AdaptiveFormField(
      {super.key,
      required this.label,
      this.inputType,
      this.validator,
      this.placeholder,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return !Platform.isIOS
        ? ListTile(
          title: Text(label.toUpperCase(), style: theme.textTheme.labelSmall!.copyWith(color: Color.fromARGB(200, 60, 60, 67))),
          subtitle: CupertinoTextFormFieldRow(
              prefix: Text(prefix!),
              keyboardType: inputType,
              validator: validator,
              placeholder: placeholder,
            ),
        )
        : TextFormField(
            decoration: InputDecoration(
                labelText: label,
                hintText: placeholder,
                prefixIcon: Text(prefix!),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0)),
            validator: validator,
            keyboardType: inputType,
          );
  }
}
