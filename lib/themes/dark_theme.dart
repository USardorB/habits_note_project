import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/text_theme.dart';

ThemeData darkTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xDBFFB347),
    onPrimary: Color(0xFF403E3E),
    secondary: Color(0xFF1E1E1E),
    onSecondary: Color(0xFFE4E4E4),
    error: Colors.red,
    onError: Color(0xFF403E3E),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xDDE4E4E4),
  ),
  appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Color(0xDDE4E4E4), fontWeight: FontWeight.w100),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xDBFFB347)),
    ),
    prefixIconColor: Color(0xDBFFB347),
    filled: true,
    fillColor: Color(0xFF403E3E),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 8,
      foregroundColor: Color(0xFF403E3E),
      backgroundColor: Color(0xDBFFB347),
      fixedSize: const Size(345, 52),
    ),
  ),
);
