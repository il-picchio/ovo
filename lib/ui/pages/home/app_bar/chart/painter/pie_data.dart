import 'package:flutter/material.dart';

class PieChartData {
  const PieChartData(
      {required this.color,
      required this.percent,
      required this.adjustedPercent});

  final Color color;

  /// True percent
  final double percent;

  /// Each percent cannot be less than 5 due to painting limitations
  final double adjustedPercent;
}
