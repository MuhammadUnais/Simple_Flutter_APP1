import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      cardColor: Colors.white,
      canvasColor: creamColor,
      hintColor: darkbluishColor,
      bottomAppBarColor: Colors.black,
      fontFamily: GoogleFonts.fresca().fontFamily,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.1,
        iconTheme: IconThemeData(color: Colors.deepPurple),
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      hintColor: darkbluishColor,
      bottomAppBarColor: Colors.white,
      fontFamily: GoogleFonts.fresca().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0.1,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkbluishColor = const Color(0xff1845FC);
  static Color lightdarkbluishColor = Vx.purple400;
}
