import 'package:flutter/material.dart';
import 'package:flutter_application_1/habit_note/onboarding/onboarding_view.dart';
import 'package:flutter_application_1/theme/light_theme.dart';

class HabitNoteApp extends StatelessWidget {
  const HabitNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HaBIT Note',
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // darkTheme: darkTheme,
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
