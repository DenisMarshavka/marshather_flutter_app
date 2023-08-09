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
        blurRadius: 4.0, // shadow blur
        color: Colors.black45, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
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

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: myTextTheme,
);
