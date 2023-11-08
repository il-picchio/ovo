import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

class OvoChip extends StatelessWidget {
  final bool selected;
  final String text;
  final void Function() onTap;

  const OvoChip({super.key, required this.selected, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        gradient: selected ? theme.extension<BrandColors>()!.gradient : null,
        color: selected ? null : theme.colorScheme.surfaceTint,
        border: Border.all(color: Colors.black87)
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(200.0),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(text, style:  theme.textTheme.labelMedium,),),
        ),
      ),
    );
  }
}