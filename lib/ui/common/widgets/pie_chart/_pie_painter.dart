part of 'pie_chart.dart';

class PiePainter extends CustomPainter {
  final double strokeWidth;
  final Iterable<SinglePieChartData> paints;
  final int gap;

  PiePainter({required this.strokeWidth, required PieChartData paintData})
      : paints = paintData.data.where((element) => element.adjustedPercent > 0),
        gap = paintData.gap,
        assert(paintData.data
            .where((element) => element.adjustedPercent > 0)
            .isNotEmpty),
        assert(paintData.gap >= kPieChartPadding);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final pieChartPadding = paints.length == 1 ? 0 : gap;
    final pieChartPaddingInRadians = gap * kPercentInRadians;

    // keep track of start angle for next stroke
    // starting from top
    double startAngle = -1.570796 + pieChartPaddingInRadians / 2;

    for (final data in paints) {
      final angle =
          (data.adjustedPercent - pieChartPadding) * kPercentInRadians;

      final paint = _createPaint(data);

      final path = Path()..addArc(rect, startAngle, angle);

      canvas.drawPath(path, paint);

      startAngle += angle + pieChartPaddingInRadians;
    }
  }

  Paint _createPaint(SinglePieChartData data) {
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
