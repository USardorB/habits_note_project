import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/theme/text_theme.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
  textTheme: textTheme,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: Color(0xFF1E1E1E),
    secondary: Color(0xFF1E1E1E),
    onSecondary: Color(0xFFE4E4E4),
    error: Colors.red,
    onError: Color(0xFF403E3E),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFE4E4E4),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: inputFieldColor.withOpacity(0.5),
      fontWeight: FontWeight.w100,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: inputFieldColor.withOpacity(0.5)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    prefixIconColor: primaryColor,
    filled: true,
    fillColor: secondaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFF403E3E).withOpacity(0.9),
      backgroundColor: primaryColor,
      fixedSize: const Size(345, 52),
    ),
  ),
);
