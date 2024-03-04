import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/gradient_button.dart';

class PortfolioOpenStep1 extends StatelessWidget {
  final void Function() onProceed;

  const PortfolioOpenStep1({super.key, required this.onProceed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/bird.svg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GradientButton(
                    onTap: () => onProceed(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Proceed',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10,),
                        Icon(FontAwesomeIcons.arrowRight, size: 15,)
                      ],
                    ),
                    shadows: false,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
