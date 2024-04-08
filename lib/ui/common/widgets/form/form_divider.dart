part of 'adaptive_form.dart';

class AdaptiveFormDivider extends StatelessWidget {
  const AdaptiveFormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return const Divider(
        color: Color.fromARGB(73, 60, 60, 67),
        thickness: 0.5,
      );
    }
    return const SizedBox();
  }
}
