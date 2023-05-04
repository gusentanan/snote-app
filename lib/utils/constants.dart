import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color cNotSoBlack = Color.fromARGB(255, 30, 33, 39);
const Color cWhitey = Color.fromARGB(255, 212, 212, 212);

List<Color> colorPicker = [
  Color.fromARGB(255, 19, 191, 102),
  Color.fromARGB(255, 255, 150, 37),
  Color.fromARGB(255, 232, 38, 38),
];

// text style
final TextStyle sHeading1 = GoogleFonts.poppins(
    fontSize: 23, fontWeight: FontWeight.w800, color: cNotSoBlack);
final TextStyle sHeading2 = GoogleFonts.poppins(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: cNotSoBlack);
final TextStyle sSubheader = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: cNotSoBlack);
final TextStyle sDescription = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: cNotSoBlack);

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
  onSecondary: Colors.white, // ext secondary
  onSurface: cNotSoBlack, // text primary
  onBackground: cWhitey,
  onError: Colors.red,
  brightness: Brightness.light,
);
