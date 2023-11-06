import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InvestmentsChart extends StatelessWidget {
  const InvestmentsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 13),
      ChartData(2012, -10),
      ChartData(2013, 27),
      ChartData(2014, 40)
    ];
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        header: '',
        enable: true,
        borderColor: null,
        borderWidth: 0,
        opacity: 0,
        builder: (data, point, series, pointIndex, seriesIndex) => Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          decoration: Theme.of(context).tooltipTheme.decoration,
          child: Text(data.y.toString()),
        ),
      ),
      plotAreaBorderWidth: 0,
      palette: [
        colorScheme.secondary,
        colorScheme.primary,
        Colors.indigo.shade100
      ],
      series: <ChartSeries>[
        // Renders spline chart
        SplineSeries<ChartData, int>(
            enableTooltip: true,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
