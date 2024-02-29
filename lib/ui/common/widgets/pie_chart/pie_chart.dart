import 'dart:math';

import 'package:flutter/widgets.dart';

part '_pie_painter.dart';
part 'consts.dart';
part 'pie_data.dart';

class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.child,
    super.key,
  }) : // make sure sum of data is never ovr 100 percent
        assert(data.data.fold<double>(0, (sum, data) => sum + data.percent) <= 100);

  final PieChartData data;
  // radius of chart
  final double radius;
  // width of stroke
  final double strokeWidth;

  final Widget? child;

  @override
  Widget build(context) {
    if (data.data.fold<double>(0, (sum, data) => sum + data.percent) == 0) {
      return const SizedBox();
    }
    return CustomPaint(
      painter: PiePainter(strokeWidth: strokeWidth, paintData: data.data),
      size: Size.square(radius),
      child: child,
    );
  }
}
