import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/extension/build_context.dart';
import 'package:flutter_application_1/extension/sized_box.dart';
import 'package:flutter_application_1/habit_note/auth/form.dart';
import 'package:flutter_application_1/habit_note/auth/login/login_view.dart';
import 'package:flutter_application_1/habit_note/home/home_page.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const RegisterView());
  }

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _rePassword;
  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _rePassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _rePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Let’s get to know you !',
            style: context.textTheme.titleMedium,
          ),
          Text(
            'Enter your details to continue',
            style: context.textTheme.displayMedium,
          ),
          24.h,
          AuthForm(
            name: _name,
            email: _email,
            password: _password,
            rePassword: _rePassword,
          ),
          24.h,
          Text(
            'Already have an account?',
            style: context.textTheme.displayMedium,
          ),
          InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              LogInView.route(),
            ),
            child: Text(
              'Login here',
              style: context.textTheme.titleMedium!.copyWith(
                color: primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: primaryColor,
              ),
            ),
          ),
          60.h,
          Text.rich(
            TextSpan(
              text: 'By clicking the “CREATE ACCOUNT” button, you agree to ',
              style: context.textTheme.displayMedium,
              children: [
                TextSpan(
                  text: 'Terms of use',
                  style: context.textTheme.titleMedium,
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          14.h,
          ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              HomePage.route(),
              (route) => false,
            ),
            child: const Text('CREATE ACCOUNT'),
          )
        ]),
      ),
    );
  }
}
