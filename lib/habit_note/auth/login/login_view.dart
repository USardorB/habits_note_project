import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/extension/build_context.dart';
import 'package:flutter_application_1/extension/sized_box.dart';
import 'package:flutter_application_1/habit_note/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_application_1/habit_note/auth/form.dart';
import 'package:flutter_application_1/habit_note/auth/register/register_view.dart';
import 'package:flutter_application_1/habit_note/home/home_page.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const LogInView());
  }

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome back !',
              style: context.textTheme.titleMedium,
            ),
            Text(
              'Please login with your credentials',
              style: context.textTheme.displayMedium,
            ),
            100.h,
            AuthForm(email: _email, password: _password),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  ForgotPasswordView.route(),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xff000000),
                ),
                child: Text(
                  'Forgot password?',
                  style: context.textTheme.displayMedium,
                ),
              ),
            ]),
            64.h,
            Text(
              'Don’t have an account yet ?',
              style: context.textTheme.displayMedium,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                RegisterView.route(),
              ),
              child: Text(
                'Create an account here',
                style: context.textTheme.titleMedium!.copyWith(
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: primaryColor,
                ),
              ),
            ),
            120.h,
            ElevatedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                HomePage.route(),
                (route) => false,
              ),
              child: const Text('LOG IN'),
            )
          ],
        ),
      ),
    );
  }
}
