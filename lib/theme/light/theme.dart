import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/theme/elements/shadows.dart';

part 'shadows.dart';
part 'colors.dart';

final ovoLightTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    BrandColors(
      primary: _kPrimaryColor,
      secondary: _kSecondaryColor,
      tertiary: _kTertiaryColor,
      negativeAmounts: _kSecondaryColor,
      positiveAmounts: Colors.green.shade200,
      stocks: _kStocksColor,
      bonds: _kBondsColor,
      crypto: _kCryptoColor
    ),
    Shadows(shadows: _kShadows)
  ],
  tooltipTheme: TooltipThemeData(
    preferBelow: false,
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
    textAlign: TextAlign.center,
    textStyle: const TextStyle(color: Colors.black87),
    decoration: BoxDecoration(
      boxShadow: _kShadows,
      border: Border.all(color: Colors.white),
      color: _kTertiaryColor,
      borderRadius: BorderRadius.circular(200),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(_kSecondaryColor)
    )
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: Color.fromRGBO(75, 0, 0, 1),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black87,
    surface: Colors.white,
    onSurface: Colors.black87,
    surfaceTint: Colors.white,
  ),
  textTheme: GoogleFonts.montserratTextTheme(),
  useMaterial3: true,
);
