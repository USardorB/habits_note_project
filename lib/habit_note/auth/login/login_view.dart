import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_application_1/habit_note/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_application_1/habit_note/auth/form.dart';
import 'package:flutter_application_1/habit_note/auth/register/register_view.dart';
import 'package:flutter_application_1/services/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final _formKey = GlobalKey<FormState>();
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
        child: ListView(
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
            AuthForm(email: _email, password: _password, formKey: _formKey),
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
                  color: context.appColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: context.appColors.primary,
                ),
              ),
            ),
            120.h,
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        AuthEventSignIn(
                          email: _email.text,
                          password: _password.text,
                        ),
                      );
                }
              },
              child: const Text('LOG IN'),
            )
          ],
        ),
      ),
    );
  }
}
