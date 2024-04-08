part of 'adaptive_form.dart';

class AdaptiveFormField extends StatelessWidget {
  final String label;
  final String? prefix;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final String? placeholder;
  final bool autofocus;

  const AdaptiveFormField(
      {super.key,
      required this.label,
      this.inputType,
      this.validator,
      this.placeholder,
      this.prefix,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Platform.isIOS
        ? Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(label.toUpperCase(),
                    style: theme.textTheme.labelSmall!
                        .copyWith(color: const Color.fromARGB(200, 60, 60, 67))),
              ),
              Expanded(
                flex: 2,
                child: CupertinoTextFormFieldRow(
                  prefix: prefix != null ? Text(prefix!) : null,
                  keyboardType: inputType,
                  validator: validator,
                  placeholder: placeholder,
                  autofocus: autofocus,
                  textInputAction: TextInputAction.continueAction,
                ),
              )
            ],
          )
        : TextFormField(
            decoration: InputDecoration(
                labelText: label,
                hintText: placeholder,
                prefix: prefix != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(prefix!),
                      )
                    : null,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0)),
            validator: validator,
            keyboardType: inputType,
            autofocus: autofocus,
          );
  }
}
