class Amount {
  final double value;

  bool get isPositive {
    return value > 0;
  }

  @override
  String toString() {
    return value.toStringAsFixed(2);
  }

  Amount({ required this.value });
}