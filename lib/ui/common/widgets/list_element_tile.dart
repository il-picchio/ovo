import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

class ListElementTile extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;
  final Widget main;
  final Widget right;
  const ListElementTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.main,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BrandColors>()!;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.tertiary),
              child: Icon(
                icon,
                size: 20.0,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: main,
              ),
            ),
            right
          ],
        ),
      ),
    );
  }
}
