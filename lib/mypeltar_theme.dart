import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyPeltarTheme{
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
    headline1: GoogleFonts.poppins(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.poppins(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.poppins(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
  );
  static const MaterialColor color = MaterialColor(
    0xFFB74093, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50:  Color(0xFFB74093),//10%
      100: Color(0xFFB74093),//20%
      200: Color(0xFFB74093),//30%
      300: Color(0xFFB74093),//40%
      400: Color(0xFFB74093),//50%
      500: Color(0xFFB74093),//60%
      600: Color(0xFFB74093),//70%
      700: Color(0xFFB74093),//80%
      800: Color(0xFFB74093),//90%
      900: Color(0xFFB74093),//100%
    },
  );

  static ThemeData light(){
    return ThemeData(
      primarySwatch: color,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
      textTheme: lightTextTheme,
    );
  }
}