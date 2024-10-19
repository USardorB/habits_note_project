import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/theme/text_theme.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
  textTheme: textTheme,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: secondaryColor,
    secondary: secondaryColor,
    onSecondary: inputFieldColor,
    error: Colors.red,
    onError: secondaryColor,
    surface: secondaryColor,
    onSurface: Colors.black,
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
      foregroundColor: secondaryColor,
      backgroundColor: primaryColor,
      fixedSize: const Size(345, 52),
    ),
  ),
);
