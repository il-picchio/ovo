import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/ui/pages/investments/portfolio/chart/chart.dart';
import 'package:ovo/ui/pages/investments/portfolio/portfolio_element.dart';
import 'package:ovo/ui/pages/investments/portfolio/time_horizons/time_horizons.dart';
import 'package:ovo/ui/pages/investments/portfolio/time_horizons/time_horizons_chips.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              'Investments',
              style: theme.textTheme.headlineSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text('CHF 7000', style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
                      subtitle: Text('Portfolio value', style: theme.textTheme.bodySmall,),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text('+300', style: theme.textTheme.titleLarge, textAlign: TextAlign.right,),
                      subtitle: Text('Profit and loss', style: theme.textTheme.bodySmall, textAlign: TextAlign.right,),
                      trailing: Icon(FontAwesomeIcons.arrowTrendUp, color: theme.extension<BrandColors>()!.positiveAmounts,),
                    ),
                  )
                ],
              ),
            ),
            const InvestmentsChart(),
            TimeHorizonChips(
              initialState: TimeHorizon.sixMonths,
              onSelectionChanged: (timeHorizon) {},
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Portfolio',
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: [
                    PortfolioElement(
                      icon: FontAwesomeIcons.earthAmericas,
                      title: 'VOO',
                      subtitle: 'America S&P 500 stocks',
                      value: 400,
                      percent: 40,
                    ),
                    PortfolioElement(
                      icon: FontAwesomeIcons.earthEurope,
                      title: 'VEA',
                      subtitle: 'Developed Worlds ex. US stocks',
                      value: -200,
                      percent: 20,
                    ),
                    PortfolioElement(
                      icon: FontAwesomeIcons.earthAsia,
                      title: 'VWO',
                      subtitle: 'Emerging markets stocks',
                      value: 100,
                      percent: 10,
                    ),
                    PortfolioElement(
                      icon: FontAwesomeIcons.earthAsia,
                      title: 'IVV',
                      subtitle: 'Global bonds',
                      value: 100,
                      percent: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
