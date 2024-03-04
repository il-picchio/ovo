import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/ui/common/widgets/pie_chart/pie_chart.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/models/investment_mix.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String picture;
  final String description;
  final bool preferred;
  final InvestmentMix investments;

  const InvestmentCard(
      {super.key,
      required this.title,
      required this.description,
      required this.investments,
      required this.picture,
      required this.preferred});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<BrandColors>()!;

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
                  opacity: 0.2,
                  child: SvgPicture.asset(
                    'assets/$picture.svg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      color: Color(0xFF000000)),
                ),
              ),
            ),
            if (preferred)
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
                child: PieChart(
                  strokeWidth: 4,
                  data: PieChartData(
                    chartData: [
                      if (investments.stocks > 0)
                        InitialPieChartData(
                          color: colors.stocks,
                          value: investments.stocks,
                        ),
                      if (investments.bonds > 0)
                        InitialPieChartData(
                          color: colors.bonds,
                          value: investments.bonds,
                        ),
                      if (investments.crypto > 0)
                        InitialPieChartData(
                          color: colors.crypto,
                          value: investments.crypto,
                        )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          description,
                          style: theme.textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
