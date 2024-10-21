import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/home/home_page.dart';
import 'package:flutter_application_1/habit_note/onboarding/onboarding_view.dart';
import 'package:flutter_application_1/services/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/services/auth/firebase_auth_provider.dart';
import 'package:flutter_application_1/themes/dark_theme.dart';
import 'package:flutter_application_1/themes/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: MaterialApp(
        title: 'HaBIT Note',
        home: const RootPage(),
        debugShowCheckedModeBanner: false,
        themeMode: _themeMode,
        darkTheme: darkTheme,
        theme: lightTheme,
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Handling navigation
        if (state.shouldPop) Navigator.pop(context);

        if (state.error?.isNotEmpty ?? false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
      },
      builder: (context, state) {
        return switch (state.authStatus) {
          AuthStatus.signedIn => HomePage(),
          AuthStatus.initial => SplashView(),
          AuthStatus.signedOut => OnboardingView(),
          AuthStatus.needsVerification => HomePage(),
        };
      },
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthEventInit());
    return Scaffold(
      backgroundColor: context.appColors.primary,
      body: Center(child: Image.asset(logo)),
    );
  }
}
