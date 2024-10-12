import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController? name;
  final TextEditingController email;
  final TextEditingController? password;
  final TextEditingController? rePassword;
  const AuthForm({
    super.key,
    this.name,
    required this.email,
    this.password,
    this.rePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        if (name != null)
          TextField(
            controller: name,
            decoration: const InputDecoration(
              hintText: 'Display Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
        if (name != null) const SizedBox(height: 24),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            hintText: 'Email Address',
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        if (password != null) const SizedBox(height: 24),
        if (password != null)
          TextField(
            controller: password,
            decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off_outlined),
                  selectedIcon: const Icon(Icons.visibility_outlined),
                )),
          ),
        if (rePassword != null) const SizedBox(height: 24),
        if (rePassword != null)
          TextField(
            controller: rePassword,
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(null),
            ),
          ),
      ]),
    );
  }
}
