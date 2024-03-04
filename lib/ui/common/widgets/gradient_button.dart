import 'package:flutter/material.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/core/theme/elements/shadows.dart';

class GradientButton extends StatelessWidget {
  final void Function() onTap;
  final Widget child;
  final bool shadows;

  const GradientButton({super.key, required this.onTap, required this.child, this.shadows = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: shadows ? theme.extension<Shadows>()!.shadows : [],
        borderRadius: BorderRadius.circular(200),
        gradient: theme.extension<BrandColors>()!.gradient,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(200),
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
