import 'package:ceemtax_service/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData kLightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.rubikTextTheme().copyWith(
    button: TextStyle(fontSize: 16, letterSpacing: 0.5),
    headline5: headingH1,
    headline6: headingH2,
  ),
  scaffoldBackgroundColor: kBackgroundColor1,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: kPrimaryColor,
    height: 44,
    textTheme: ButtonTextTheme.primary,
  ),
);

ThemeData kDarkTheme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: ThemeData.dark()
      .textTheme
      .apply(fontFamily: GoogleFonts.poppins().fontFamily),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey[900],
    height: 44,
    textTheme: ButtonTextTheme.primary,
  ),
);
