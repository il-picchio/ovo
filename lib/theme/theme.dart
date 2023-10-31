import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ovoTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(246, 194, 118, 1),
    secondary: Color.fromRGBO(230, 133, 133, 1),
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
