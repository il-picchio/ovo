import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/theme/elements/shadows.dart';

class InvestButton extends StatelessWidget {
  const InvestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: theme.extension<Shadows>()!.shadows,
        borderRadius: BorderRadius.circular(200),
        gradient: theme.extension<BrandColors>()!.gradient,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(200),
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.chartLine),
                SizedBox(width: 20,),
                Text(
                  'Start investing',
                  style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
