part of 'pie_chart.dart';

class InitialPieChartData {
  const InitialPieChartData({required this.color, required this.value});

  final Color color;

  /// True value
  final double value;
}

class SinglePieChartData extends InitialPieChartData {
  const SinglePieChartData(
      {required super.color,
      required super.value,
      required this.percent,
      required this.adjustedPercent});

  /// True percent
  final double percent;

  /// Each percent cannot be less than 5 due to painting limitations
  final double adjustedPercent;
}

class PieChartData {
  const PieChartData({required Iterable<InitialPieChartData> chartData})
      : _baseData = chartData;

  final Iterable<InitialPieChartData> _baseData;

  Iterable<SinglePieChartData> get data {
    final total = _baseData.fold(
        0.0, (previousValue, element) => previousValue + element.value);
    if (total <= 0.0) {
      return [];
    }

    final compensation = _baseData.fold(0.0,
        (value, element) => value += max(kDoublePieChartPaddingPercent - element.value / total, 0));

    final compensationFactor = 1 - compensation;

    return _baseData.map((e) {
      final percent = (e.value / total) * 100;
      return SinglePieChartData(
          color: e.color,
          value: e.value,
          percent: percent,
          adjustedPercent: max(percent * compensationFactor, kDoublePieChartPadding.toDouble()));
    });
  }
}
