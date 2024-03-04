import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/ui/common/widgets/pie_chart/pie_chart.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/2/investment_card.dart';

class PortfolioOpenStep3 extends StatelessWidget {
  final InvestmentCard investmentCard;
  const PortfolioOpenStep3({super.key, required this.investmentCard});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<BrandColors>()!;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Text('Customize portfolio', textAlign: TextAlign.center, style: theme.textTheme.titleLarge,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
                vertical: 20.0
              ),
            child: PieChart(
              data: PieChartData(chartData: [
                InitialPieChartData(color: colors.crypto, value: 10),
                InitialPieChartData(color: colors.stocks, value: 58.5),
                InitialPieChartData(color: colors.stocks, value: 22.5),
                InitialPieChartData(color: colors.stocks, value: 9),
              ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    investmentCard.title,
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      investmentCard.description,
                      style: theme.textTheme.labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          DataTable(
            showCheckboxColumn: false,
            
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Ticker')),
              DataColumn(label: Text('Percent')),
            ],
            rows: [
              DataRow(
                onSelectChanged: (result) {
                  print('oh');
                },
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
