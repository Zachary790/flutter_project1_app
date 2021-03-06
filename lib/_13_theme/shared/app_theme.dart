import 'package:flutter/material.dart';
class HYAppTheme {

  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.yellow,
    textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize,color: Colors.red)
    )
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize,color: Colors.green)
    )
  );
}