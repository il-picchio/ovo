import 'package:flutter/material.dart';

class BrandColors extends ThemeExtension<BrandColors> {
  final Color primary;
  final Color secondary;
  final Color secondaryTextColor;
  final Color tertiary;
  final Color stocks;
  final Color bonds;
  final Color crypto;
  final Color negativeAmounts;
  final Color positiveAmounts;
  final Color errorColor;

  final Gradient gradient;

  BrandColors(
      {required this.primary,
      required this.secondary,
      required this.secondaryTextColor,
      required this.tertiary,
      required this.negativeAmounts,
      required this.positiveAmounts,
      required this.stocks,
      required this.bonds,
      required this.crypto,
      required this.errorColor})
      : gradient = LinearGradient(
            colors: [primary, secondary],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight);

  @override
  ThemeExtension<BrandColors> copyWith(
      {Color? primary,
      Color? secondary,
      Color? secondaryTextColor,
      Color? tertiary,
      Color? stocks,
      Color? bonds,
      Color? crypto,
      Color? negativeAmounts,
      Color? positiveAmounts,
      Color? errorColor}) {
    return BrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
        tertiary: tertiary ?? this.tertiary,
        stocks: stocks ?? this.stocks,
        bonds: bonds ?? this.bonds,
        crypto: crypto ?? this.crypto,
        negativeAmounts: negativeAmounts ?? this.negativeAmounts,
        positiveAmounts: positiveAmounts ?? this.positiveAmounts,
        errorColor: errorColor ?? this.errorColor);
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
        secondaryTextColor:
            Color.lerp(secondaryTextColor, other.secondaryTextColor, t) ??
                secondaryTextColor,
        tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
        stocks: Color.lerp(stocks, other.stocks, t) ?? stocks,
        bonds: Color.lerp(bonds, other.bonds, t) ?? bonds,
        crypto: Color.lerp(crypto, other.crypto, t) ?? crypto,
        negativeAmounts:
            Color.lerp(negativeAmounts, other.negativeAmounts, t) ??
                negativeAmounts,
        positiveAmounts:
            Color.lerp(positiveAmounts, other.positiveAmounts, t) ??
                positiveAmounts,
        errorColor: Color.lerp(errorColor, other.errorColor, t) ?? errorColor);
  }
}
