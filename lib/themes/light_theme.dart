import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/text_theme.dart';

ThemeData lightTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffFFB347),
    onPrimary: Color(0x88000000),
    secondary: Color(0xffFFFFFF),
    onSecondary: Color(0x88000000),
    error: Colors.red,
    onError: Color(0xFF403E3E),
    surface: Color(0xffFFFFFF),
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0x55000000), fontWeight: FontWeight.w100),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x88000000)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffFFB347)),
    ),
    prefixIconColor: Color(0xffFFB347),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 8,
      foregroundColor: Color(0xffFFFFFF),
      backgroundColor: Color(0xffFFB347),
      fixedSize: const Size(345, 52),
    ),
  ),
);
