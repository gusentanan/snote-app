import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color cNotSoBlack = Color.fromARGB(255, 30, 33, 39);
const Color cWhitey = Color.fromARGB(255, 212, 212, 212);

const Color cHigh = Colors.red;
const Color cMedium = Colors.orange;
const Color cLow = Colors.green;

// text style
final TextStyle sHeading1 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle sHeading2 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle sSubheader = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle sDescription = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final sTextTheme = TextTheme(
  titleLarge: sHeading1,
  titleMedium: sHeading2,
  bodyMedium: sSubheader,
  bodySmall: sDescription,
);

const sColorScheme = ColorScheme(
  primary: cWhitey,
  primaryContainer: cWhitey,
  secondary: Colors.white,
  secondaryContainer: Colors.white,
  surface: cWhitey,
  background: cWhitey,
  error: Colors.red,
  onPrimary: cWhitey,
  onSecondary: Colors.white,
  onSurface: cWhitey,
  onBackground: cWhitey,
  onError: Colors.red,
  brightness: Brightness.dark,
);
