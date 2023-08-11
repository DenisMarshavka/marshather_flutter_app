import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palette.dart';

final TextTheme myTextTheme = TextTheme(
  titleLarge: GoogleFonts.rubik(
    fontSize: 125,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    shadows: const [
      Shadow(
        blurRadius: 4.0,
        color: Colors.black45,
        offset: Offset(0.0, 0.0),
      ),
    ],
  ),
  titleMedium: GoogleFonts.rubik(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  titleSmall: GoogleFonts.rubik(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
  ),
  headlineSmall: GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Palette.textColorGrey,
  ),
  headlineMedium: GoogleFonts.rubik(
    fontWeight: FontWeight.bold,
    color: Palette.textColorGrey,
  ),
  headlineLarge: GoogleFonts.rubik(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Palette.textColorGrey,
  ),
);

MaterialColor myBlackMaterialSwatch = const MaterialColor(
  0xFF000000, // The primary color value (black in this case)
  <int, Color>{
    50: Color(0xFFE0E0E0), // Shades/tints can be defined here
    100: Color(0xFFB0B0B0),
    200: Color(0xFF808080),
    300: Color(0xFF505050),
    400: Color(0xFF303030),
    500: Color(0xFF000000), // This is the primary color
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

final ThemeData myTheme = ThemeData(
  primarySwatch: myBlackMaterialSwatch,
  textTheme: myTextTheme,
);
