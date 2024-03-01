import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/pie_chart/pie_chart.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String description;
  final Iterable<SinglePieChartData> data;

  const InvestmentCard(
      {super.key,
      required this.title,
      required this.description,
      required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      elevation: 20,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: 0.05,
                  child: SvgPicture.asset(
                    'assets/bird.svg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tooltip(
                  child: Icon(FontAwesomeIcons.circleCheck),
                  message: 'Adviced',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PieChart(
                      strokeWidth: 4,
                      data: PieChartData(
                        chartData: [
                          InitialPieChartData(color: Colors.red, value: 60),
                          InitialPieChartData(color: Colors.blue, value: 37),
                          InitialPieChartData(color: Colors.green, value: 3)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.titleLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              description,
                              style: theme.textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
