import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/gradient_button.dart';
import 'package:ovo/ui/common/widgets/pie_chart/pie_chart.dart';

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
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => onProceed(),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PieChart(
                data: [
                  PieChartData(
                      color: Colors.blue.shade300,
                      percent: 40,
                      adjustedPercent: 40),
                  PieChartData(
                      color: Colors.red.shade300,
                      percent: 60,
                      adjustedPercent: 60)
                ],
                radius: MediaQuery.of(context).size.width - 40,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    'Adventure',
                    style: theme.textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 40.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesomeIcons.egg,
                          size: 40,
                        ),
                        Icon(
                          FontAwesomeIcons.egg,
                          size: 40,
                        ),
                        Icon(
                          FontAwesomeIcons.egg,
                          size: 40,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
