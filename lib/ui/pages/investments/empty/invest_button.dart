import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/gradient_button.dart';

class InvestButton extends StatelessWidget {
  const InvestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GradientButton(
      onTap: () => Navigator.pushNamed(context, '/open-portfolio'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(FontAwesomeIcons.chartLine),
          const SizedBox(
            width: 20,
          ),
          Text(
            'Start investing',
            style: theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
