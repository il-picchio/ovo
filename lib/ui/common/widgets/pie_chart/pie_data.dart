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
  PieChartData({required Iterable<InitialPieChartData> chartData, this.gap = kPieChartPadding})
      : data = _normalizeData(chartData, gap);

  final Iterable<SinglePieChartData> data;

  final int gap;

  static Iterable<SinglePieChartData> _normalizeData(Iterable<InitialPieChartData> baseData, int gap) {
    final total = baseData.fold(
        0.0, (previousValue, element) => previousValue + element.value);

    final doublePieChartPadding = 2 * gap;
    final doublePieChartPaddingPercent = doublePieChartPadding / 100;

    if (total <= 0.0) {
      return [];
    }

    final compensation = baseData.fold(0.0,
        (value, element) => value += max(doublePieChartPaddingPercent - element.value / total, 0));

    final compensationFactor = 1 - compensation;

    return baseData.map((e) {
      final percent = (e.value / total) * 100;
      return SinglePieChartData(
          color: e.color,
          value: e.value,
          percent: percent,
          adjustedPercent: max(percent * compensationFactor, doublePieChartPadding.toDouble()));
    });
  }
}
