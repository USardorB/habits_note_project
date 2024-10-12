import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
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
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Let’s get to know you !',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            'Enter your details to continue',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
          const SizedBox(height: 24),
          AuthForm(
            name: _name,
            email: _email,
            password: _password,
            rePassword: _rePassword,
          ),
          const SizedBox(height: 24),
          const Text(
            'Already have an account?',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
          InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              LogInView.route(),
            ),
            child: const Text(
              'Login here',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 60),
          const Text.rich(
            TextSpan(
              text: 'By clicking the “CREATE ACCOUNT” button, you agree to ',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              children: [
                TextSpan(
                  text: 'Terms of use',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
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
