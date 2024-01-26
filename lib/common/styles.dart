import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromARGB(255, 27, 42, 172);
const Color secondaryColor = Color.fromARGB(255, 27, 42, 172);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
    // Ganti dengan font yang kekinian, misalnya Poppins
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
    color: secondaryColor,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: secondaryColor,
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: 46,
    fontWeight: FontWeight.w400,
    color: secondaryColor,
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: secondaryColor,
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: secondaryColor,
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: secondaryColor,
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: secondaryColor,
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: secondaryColor,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: secondaryColor,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: secondaryColor,
  ),
  labelLarge: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: secondaryColor,
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: secondaryColor,
  ),
  labelSmall: GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: secondaryColor,
  ),
);
