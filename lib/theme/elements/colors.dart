import 'package:flutter/material.dart';

class BrandColors extends ThemeExtension<BrandColors> {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color negativeAmounts;
  final Color positiveAmounts;

  final Gradient gradient;

  BrandColors(
      {required this.primary,
      required this.secondary,
      required this.tertiary,
      required this.negativeAmounts,
      required this.positiveAmounts})
      : gradient = LinearGradient(
            colors: [primary, secondary],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight);

  @override
  ThemeExtension<BrandColors> copyWith(
      {Color? primary,
      Color? secondary,
      Color? tertiary,
      Color? negativeAmounts,
      Color? positiveAmounts}) {
    return BrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        negativeAmounts: negativeAmounts ?? this.negativeAmounts,
        positiveAmounts: positiveAmounts ?? this.positiveAmounts);
  }

  @override
  ThemeExtension<BrandColors> lerp(
      covariant ThemeExtension<BrandColors>? other, double t) {
    if (other is! BrandColors) {
      return this;
    }
    return BrandColors(
        primary: Color.lerp(primary, other.primary, t) ?? primary,
        secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
        tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
        negativeAmounts:
            Color.lerp(negativeAmounts, other.negativeAmounts, t) ??
                negativeAmounts,
        positiveAmounts:
            Color.lerp(positiveAmounts, other.positiveAmounts, t) ??
                positiveAmounts);
  }
}
