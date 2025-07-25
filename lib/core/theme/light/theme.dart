import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/core/theme/elements/shadows.dart';

part 'shadows.dart';
part 'colors.dart';

final ovoLightTheme = ThemeData(
  splashColor: Platform.isIOS ? Colors.transparent : null,
  highlightColor: Platform.isIOS ? Colors.transparent : null,
  extensions: <ThemeExtension<dynamic>>[
    BrandColors(
        primary: _kPrimaryColor,
        secondary: _kSecondaryColor,
        secondaryTextColor: _kSecondaryTextColor,
        tertiary: _kTertiaryColor,
        negativeAmounts: _kSecondaryColor,
        positiveAmounts: Colors.green.shade200,
        stocks: _kStocksColor,
        bonds: _kBondsColor,
        crypto: _kCryptoColor,
        errorColor:
            Platform.isIOS ? CupertinoColors.systemRed : Colors.red.shade700),
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
  filledButtonTheme: const FilledButtonThemeData(
      style:
          ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.black))),
  inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black87),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 0.5))),
  cardTheme: const CardTheme(elevation: 10),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(_kSecondaryTextColor),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.pressed)
              ? _kSecondaryTextColor.withOpacity(0.05)
              : null;
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(_kSecondaryTextColor),
      side: const MaterialStatePropertyAll(
        BorderSide(color: _kSecondaryTextColor),
      ),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.pressed)
              ? _kSecondaryTextColor.withOpacity(0.05)
              : null;
        },
      ),
    ),
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
    primaryColor: _kSecondaryColor,
    primaryContrastingColor: Colors.black87,
    textTheme: CupertinoTextThemeData(
      textStyle: GoogleFonts.montserrat().copyWith(color: Colors.black87),
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: _kSecondaryTextColor,
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
