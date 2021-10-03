import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required double letterSpacing,
    double height = 1.2,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    ).copyWith(fontWeight: FontWeight.w600));
  }

  static final primaryBoldText = getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0,
  );
  static final secondaryBoldText = getAppFont(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: -0.5,
  );
  static final primaryText = getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    letterSpacing: 0,
  );
  static final secondaryText = getAppFont(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    letterSpacing: 0,
  );
}
