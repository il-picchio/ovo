import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/core/routes/routes.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';

class QuestionsResult extends StatelessWidget {
  const QuestionsResult({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
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
            child: AdaptiveButton(
              type: ButtonType.elevated,
              onPressed: () => Navigator.of(context).popAndPushNamed(Routes.wealthAnalysis),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Start investing',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.arrowRight, size: 15,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
