import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_application_1/habit_note/auth/form.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const ForgotPasswordView());
  }

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _email;
  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please enter your account’s email address and we will send you a link to reset your password.',
            ),
            72.h,
            AuthForm(email: _email),
            360.h,
            ElevatedButton(onPressed: () {}, child: const Text('SUBMIT'))
          ],
        ),
      ),
    );
  }
}
