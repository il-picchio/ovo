part of 'pie_chart.dart';

class PiePainter extends CustomPainter {
  final double strokeWidth;
  final Iterable<SinglePieChartData> paints;

  PiePainter(
      {required this.strokeWidth, Iterable<SinglePieChartData> paintData = const []})
      : paints = paintData.where((element) => element.adjustedPercent > 0),
        assert(paintData.where((element) => element.adjustedPercent > 0).isNotEmpty);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final pieChartPadding = paints.length == 1 ? 0 : kPieChartPadding;
    final pieChartPaddingInRadians = pieChartPadding * kPercentInRadians;

    // keep track of start angle for next stroke
    // starting from top
    double startAngle = -1.570796 + pieChartPaddingInRadians / 2;


    for (final data in paints) {
      final angle = (data.adjustedPercent - pieChartPadding) * kPercentInRadians;

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
