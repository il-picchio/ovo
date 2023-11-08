import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  static const double _strokeWidth = 3;
  static const double _percentInRadians = 0.062831853071796;

  final Color color;
  final double percent;

  CirclePainter({required this.color, required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // keep track of start angle for next stroke
    // starting from top
    double startAngle = -3.14;

    final paint = _createPaint();

    final path = Path()
      ..addArc(rect, startAngle, percent * CirclePainter._percentInRadians);

    canvas.drawPath(path, paint);
  }

  Paint _createPaint() {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = CirclePainter._strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
