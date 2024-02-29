import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/pie_chart/pie_chart.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/badge.dart';

class Chart extends StatelessWidget {
  static const double _strokeWidth = 10;

  final double investments;
  final double account;

  const Chart({super.key, required this.account, required this.investments});

  PieChartData _normalizeData(BuildContext context) {
    final total = investments + account;
    if (total == 0 || investments == 0) {
      return PieChartData(chartData: [
        InitialPieChartData(
            color: Theme.of(context).colorScheme.primary, value: account)
      ]);
    }
    return PieChartData(chartData: [
      InitialPieChartData(
          color: Theme.of(context).colorScheme.primary, value: account),
      InitialPieChartData(
          color: Theme.of(context).colorScheme.secondary, value: investments)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - _strokeWidth;
    final chartData = _normalizeData(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(47),
                child: PieChart(
                  data: chartData,
                  strokeWidth: _strokeWidth,
                ),
              ),
            ),
            if (chartData.data.lastOrNull != null)
              Align(
                alignment: Alignment(
                  sin((-chartData.data.last.adjustedPercent *
                          kPercentInRadians) /
                      2),
                  -cos((-chartData.data.last.adjustedPercent *
                          kPercentInRadians) /
                      2),
                ),
                child: ChartBadge(
                  icon: FontAwesomeIcons.chartLine,
                  text: 'Investments\nCHF $investments',
                ),
              ),
            if (chartData.data.firstOrNull != null)
              Align(
                alignment: Alignment(
                    sin(chartData.data.first.adjustedPercent *
                        kPercentInRadians /
                        2),
                    -cos(chartData.data.first.adjustedPercent *
                        kPercentInRadians /
                        2)),
                child: ChartBadge(
                  icon: FontAwesomeIcons.coins,
                  text: 'Account\nCHF $account',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
