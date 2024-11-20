import 'package:flutter/material.dart';

class AppFont {
  static const String helvetica = 'Helvetica';

  // h1
  static TextStyle h1({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: helvetica,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  // h2
  static TextStyle h2({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: helvetica,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  // h3
  static TextStyle h3({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: helvetica,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}
