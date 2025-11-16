import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  // --- DISPLAY ---
  static TextStyle displayRegular({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSansDisplay(
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      );

  static TextStyle displayMedium({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSansDisplay(
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: color,
      );

  static TextStyle displaySemiBold({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSansDisplay(
        fontWeight: FontWeight.w600,
        fontSize: size,
        color: color,
      );

  static TextStyle displayBold({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSansDisplay(
        fontWeight: FontWeight.w700,
        fontSize: size,
        color: color,
      );

  // --- TEXT ---
  static TextStyle textRegular({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSans(
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      );

  static TextStyle textMedium({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSans(
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: color,
      );

  static TextStyle textSemiBold({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSans(
        fontWeight: FontWeight.w600,
        fontSize: size,
        color: color,
      );

  static TextStyle textBold({
    required double size,
    Color color = Colors.black,
  }) =>
      GoogleFonts.notoSans(
        fontWeight: FontWeight.w700,
        fontSize: size,
        color: color,
      );
}
