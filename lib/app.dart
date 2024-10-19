import 'package:flutter/material.dart';
import 'package:flutter_application_1/habit_note/onboarding/onboarding_view.dart';
import 'package:flutter_application_1/themes/dark_theme.dart';
import 'package:flutter_application_1/themes/light_theme.dart';

class HabitNoteApp extends StatefulWidget {
  const HabitNoteApp({super.key});

  // ignore: library_private_types_in_public_api
  static _HabitNoteAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_HabitNoteAppState>()!;

  @override
  State<HabitNoteApp> createState() => _HabitNoteAppState();
}

class _HabitNoteAppState extends State<HabitNoteApp> {
  ThemeMode? _themeMode;
  void changeTheme(ThemeMode themeMode) =>
      setState(() => _themeMode = themeMode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HaBIT Note',
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      darkTheme: darkTheme,
      theme: lightTheme,
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingView();
  }
}
