part of 'button.dart';

class IOSButton extends StatelessWidget {
  final ButtonType type;
  final void Function()? onPressed;
  final Widget child;
  final EdgeInsets? padding;

  const IOSButton(
      {super.key,
      required this.type,
      this.onPressed,
      this.padding,
      required this.child});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.elevated:
        return CustomCupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          onPressed: onPressed,
          backgroundPadding: padding ?? _kBackgroundButtonPadding,
          child: child,
        );
      case ButtonType.outlined:
      case ButtonType.text:
        return CupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          onPressed: onPressed,
          child: child,
        );
    }
  }
}
