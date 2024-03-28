part of 'button.dart';

class AndroidButton extends StatelessWidget {
  final ButtonType type;
  final void Function() onPressed;
  final Widget child;
  final EdgeInsets? externalPadding;
  final EdgeInsets? internalPadding;

  const AndroidButton(
      {super.key,
      required this.type,
      required this.onPressed,
      required this.child,
      this.internalPadding,
      this.externalPadding
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BrandColors>()!;
    switch (type) {
      case ButtonType.elevated:
        return Padding(
          // ElevatedButton has default 5 padding on top and bottom
          padding: externalPadding ?? const EdgeInsets.symmetric(
            vertical: 5,
          ),
          // DecoratedBox contains our linear gradient
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(200),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: theme.gradient,
                // Round the DecoratedBox to match ElevatedButton
                borderRadius: BorderRadius.circular(200),
              ),
              child: FilledButton(
                onPressed: onPressed,
                // Duplicate the default styling of an ElevatedButton
                style: ElevatedButton.styleFrom(
                  //minimumSize: Size.fromRadius(0.0),
                  // Enables us to see the BoxDecoration behind the ElevatedButton
                  backgroundColor: Colors.transparent,
                  padding: internalPadding,
                  // Fits the Ink in the BoxDecoration
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ).merge(
                  ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size.fromRadius(0.0)),
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return states.contains(MaterialState.pressed)
                            ? Colors.white12
                            : null;
                      },
                    ),
                    // Elevation declared here so we can cover onPress elevation
                    // Declaring in styleFrom does not allow for MaterialStateProperty
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
                child: child,
              ),
            ),
          ),
        );
      case ButtonType.outlined:
        return OutlinedButton(onPressed: onPressed, child: child,);
      case ButtonType.text:
        return TextButton(onPressed: onPressed, child: child);
    }
  }
}
