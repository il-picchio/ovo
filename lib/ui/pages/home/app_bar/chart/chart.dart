import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/_consts.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/badge.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/painter/pie_chart.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/painter/pie_data.dart';

class Chart extends StatelessWidget {
  static const double _strokeWidth = 20;

  final double investments;
  final double account;

  const Chart({super.key, required this.account, required this.investments});

  Iterable<PieChartData> _normalizeData(BuildContext context) {
    final total = investments + account;
    if (total == 0 || investments == 0) {
      return [
        PieChartData(
            color: Theme.of(context).colorScheme.primary,
            percent: 100,
            adjustedPercent: 100)
      ];
    }
    if (account == 0) {
      return [
        PieChartData(
            color: Theme.of(context).colorScheme.primary,
            percent: 0,
            adjustedPercent: 0),
        PieChartData(
            color: Theme.of(context).colorScheme.secondary,
            percent: 100,
            adjustedPercent: 100)
      ];
    }
    return [
      PieChartData(
          color: Theme.of(context).colorScheme.primary,
          percent: account * 100 / total,
          adjustedPercent: (account * 100 / total).clamp(5, 95)),
      PieChartData(
          color: Theme.of(context).colorScheme.secondary,
          percent: (investments * 100 / total),
          adjustedPercent: (investments * 100 / total).clamp(5, 95))
    ];
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
                padding: const EdgeInsets.all(50),
                child: PieChart(
                  data: chartData,
                  radius: width,
                  strokeWidth: _strokeWidth,
                ),
              ),
            ),
            Align(
              alignment: Alignment(
                sin((-chartData.last.adjustedPercent * kPercentInRadians) / 2),
                -cos((-chartData.last.adjustedPercent * kPercentInRadians) / 2),
              ),
              child: ChartBadge(
                icon: FontAwesomeIcons.chartLine,
                text: 'Investments\nCHF $investments',
              ),
            ),
            Align(
              alignment: Alignment(
                  sin(chartData.first.adjustedPercent * kPercentInRadians / 2),
                  -cos(
                      chartData.first.adjustedPercent * kPercentInRadians / 2)),
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
