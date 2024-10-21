import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_application_1/habit_note/auth/form.dart';
import 'package:flutter_application_1/habit_note/auth/login/login_view.dart';
import 'package:flutter_application_1/services/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final _formKey = GlobalKey<FormState>();
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
        child: ListView(children: [
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
            formKey: _formKey,
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
                color: context.appColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: context.appColors.primary,
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      AuthEventSignUp(
                        name: _name.text,
                        email: _email.text,
                        password: _password.text,
                      ),
                    );
              }
            },
            child: const Text('CREATE ACCOUNT'),
          )
        ]),
      ),
    );
  }
}
