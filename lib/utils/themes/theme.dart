import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: CustomTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: CustomTextTheme.darkTextTheme,
  );
}
