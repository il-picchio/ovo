import 'package:flutter/widgets.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/_consts.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/painter/pie_data.dart';

class PiePainter extends CustomPainter {
  final double strokeWidth;
  final Iterable<PieChartData> paints;

  PiePainter(
      {required this.strokeWidth, Iterable<PieChartData> paintData = const []})
      : paints = paintData.where((element) => element.adjustedPercent > 0),
        assert(paintData.where((element) => element.adjustedPercent > 0).isNotEmpty);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // keep track of start angle for next stroke
    // starting from top
    double startAngle = -1.570796 + kPaddingInRadians / 2;

    for (final data in paints) {
      final angle = (data.adjustedPercent - kPadding) * kPercentInRadians;

      final paint = _createPaint(data);

      final path = Path()..addArc(rect, startAngle, angle);

      canvas.drawPath(path, paint);

      startAngle += angle + kPaddingInRadians;
    }
  }

  Paint _createPaint(PieChartData data) {
    return Paint()
      ..color = data.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
