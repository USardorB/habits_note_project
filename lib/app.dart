import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/habit_note/onboarding/onboarding_view.dart';

class HabitNoteApp extends StatelessWidget {
  const HabitNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HaBIT Note',
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: secondaryColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        scaffoldBackgroundColor: secondaryColor,
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
              textStyle: const TextStyle(fontSize: 18),
              fixedSize: const Size(345, 52)),
        ),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Onboarding();
  }
}
