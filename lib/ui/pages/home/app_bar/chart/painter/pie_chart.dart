import 'package:flutter/widgets.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/painter/pie_data.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/painter/pie_painter.dart';

class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    super.key,
  }) : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100);

  final Iterable<PieChartData> data;
  // radius of chart
  final double radius;
  // width of stroke
  final double strokeWidth;

  @override
  Widget build(context) {
    return CustomPaint(
        painter: PiePainter(strokeWidth: strokeWidth, paintData: data),
        size: Size.square(radius));
  }
}
