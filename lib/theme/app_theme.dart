import 'package:flutter/material.dart';

var kPrimaryColor = Color(0xff161E54);

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: MaterialColor(
      0xFF161E54,
      <int, Color>{
        50: Color(0xFF161E54),
        100: Color(0xFF161E54),
        200: Color(0xFF161E54),
        300: Color(0xFF161E54),
        400: Color(0xFF161E54),
        500: Color(0xFF161E54),
        600: Color(0xFF161E54),
        700: Color(0xFF161E54),
        800: Color(0xFF161E54),
        900: Color(0xFF161E54),
      },
    ),
    fontFamily: 'antonio',
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      focusColor: kPrimaryColor,
      helperStyle: TextStyle(fontSize: 18, color: kPrimaryColor),
      labelStyle: TextStyle(fontSize: 18),
      hintStyle: TextStyle(fontSize: 18),
      errorStyle: TextStyle(fontSize: 12, height: 0.8),
      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    ),
  );
}
