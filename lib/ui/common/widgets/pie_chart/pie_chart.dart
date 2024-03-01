import 'dart:math';

import 'package:flutter/widgets.dart';

part '_pie_painter.dart';
part 'consts.dart';
part 'pie_data.dart';

class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    this.strokeWidth = 8,
    this.child,
    super.key,
  }) : // make sure sum of data is never ovr 100 percent
        assert(data.data.fold<double>(0, (sum, data) => sum + data.percent) <=
            100);

  final PieChartData data;
  // width of stroke
  final double strokeWidth;

  final Widget? child;

  @override
  Widget build(context) {
    if (data.data.any((element) => element.percent > 0)) {
      return AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: PiePainter(strokeWidth: strokeWidth, paintData: data),
          size: Size.infinite,
          child: child,
        ),
      );
    }
    return const SizedBox();
  }
}
