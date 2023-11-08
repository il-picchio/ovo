import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/shadows.dart';

class CreditCardAction extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const CreditCardAction(
      {super.key,
      required this.icon,
      required this.text,
      this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadows = theme.extension<Shadows>()!.shadows;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.surfaceTint,
        boxShadow: shadows,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Icon(
                      icon,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
