import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2ee);
  static Color mainColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize:18.0,
    fontWeight: FontWeight.bold ,
    color: Colors.black,
  );
  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize:16.0,
    fontWeight: FontWeight.normal ,
    color: Colors.black,
  );
  static TextStyle dateTitle = GoogleFonts.roboto(
    fontSize:13.0,
    fontWeight: FontWeight.w500 ,
    color: Colors.black,
  );
}
