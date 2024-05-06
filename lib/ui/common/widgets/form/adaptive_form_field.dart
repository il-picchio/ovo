part of 'adaptive_form.dart';

class AdaptiveFormField extends StatelessWidget {
  final String? prefix;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final String? placeholder;
  final bool autofocus;
  final void Function(PointerDownEvent) onTapOutside;
  final void Function(String) onChange;

  AdaptiveFormField(
      {super.key,
      required this.onChange,
      this.inputType,
      this.validator,
      this.placeholder,
      this.prefix,
      this.autofocus = false,
      void Function(PointerDownEvent)? onTapOutside})
      : onTapOutside = onTapOutside ??
            ((pointer) => FocusManager.instance.primaryFocus?.unfocus());

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? TapRegion(
            onTapOutside: onTapOutside,
            child: CupertinoTextFormFieldRow(
              onChanged: onChange,
              padding: const EdgeInsets.all(0.0),
              prefix: prefix != null ? Text(prefix!) : null,
              keyboardType: inputType,
              validator: validator,
              placeholder: placeholder,
              autofocus: autofocus,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.continueAction,
            ),
          )
        : TextFormField(
            onChanged: onChange,
            onTapOutside: onTapOutside,
            decoration: InputDecoration(
              errorMaxLines: 2,
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
            textAlign: TextAlign.center,
            autofocus: autofocus,
          );
  }
}
