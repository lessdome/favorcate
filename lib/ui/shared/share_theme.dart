import 'package:flutter/material.dart';

class AppTheme {
  static const double bodySmallFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 22;

  static const Color norTextColors = Colors.red;
  static const Color darkTextColors = Colors.green;

  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: bodySmallFontSize,
      ),
      displaySmall: TextStyle(
        fontSize: smallFontSize,
        color: Colors.black87,
      ),
      displayMedium: TextStyle(
        fontSize: normalFontSize,
        color: Colors.black54,
      ),
      displayLarge: TextStyle(
        fontSize: largeFontSize,
        color: Colors.black54,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: normalFontSize,
        color: darkTextColors,
      ),
    ),
  );
}
