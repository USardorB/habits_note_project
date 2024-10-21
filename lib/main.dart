import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/services/auth/firebase_auth_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuthProvider.initializeFirebase();
  runApp(const HabitNoteApp());
}
