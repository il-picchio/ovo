import 'package:flutter/material.dart';

class Shadows extends ThemeExtension<Shadows> {
  final List<BoxShadow> shadows;
  const Shadows({ required this.shadows });
  
  @override
  ThemeExtension<Shadows> copyWith({ List<BoxShadow>? shadows }) {
    return Shadows(shadows: shadows ?? this.shadows);
  }
  
  @override
  ThemeExtension<Shadows> lerp(covariant ThemeExtension<Shadows>? other, double t) {
    if (other is! Shadows) {
      return this;
    }
    return Shadows(shadows: BoxShadow.lerpList(shadows, other.shadows, t) ?? []);
  }
}
