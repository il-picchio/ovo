import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ovo/ui/common/widgets/gradient_button.dart';

class PortfolioOpenStep1 extends StatelessWidget {
  final void Function() onProceed;

  const PortfolioOpenStep1({super.key, required this.onProceed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Your profile is'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Wild bird',
            style: theme.textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'You are willing to assume higher risk for higher returns',
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Stack(
          children: [
            SvgPicture.asset(
              'assets/bird.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GradientButton(
                    onTap: () => onProceed(), child: Text('Proceed'), shadows: false,),
              ),
            ),
          ],
        )
      ],
    );
  }
}
