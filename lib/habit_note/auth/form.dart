import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController? name;
  final TextEditingController email;
  final TextEditingController? password;
  final TextEditingController? rePassword;
  final GlobalKey<FormState> formKey;
  const AuthForm({
    super.key,
    this.name,
    required this.email,
    this.password,
    this.rePassword,
    required this.formKey,
  });
  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: AutofillGroup(
        child: Column(children: [
          if (name != null)
            TextFormField(
              validator: (value) {
                final userInput = value;
                if (userInput != null) {
                  if (userInput.trim().isNotEmpty) {
                    return null;
                  }
                }
                return 'Please provide a real name';
              },
              controller: name,
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.name],
              decoration: const InputDecoration(
                hintText: 'Display Name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
          if (name != null) 24.h,
          TextFormField(
            validator: (value) {
              final userInput = value;
              if (userInput != null) if (regex.hasMatch(userInput)) return null;
              return 'Invalid Email Format';
            },
            controller: email,
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            decoration: const InputDecoration(
              hintText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          if (password != null) 24.h,
          if (password != null)
            TextFormField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                final userInput = value;
                if (userInput != null) {
                  if (userInput.length > 5) return null;
                  return 'Weak password, minimum length 6';
                }
                return 'Password must be provided';
              },
              autofillHints: [
                rePassword != null
                    ? AutofillHints.newPassword
                    : AutofillHints.password
              ],
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off_outlined),
                    selectedIcon: const Icon(Icons.visibility_outlined),
                  )),
            ),
          if (rePassword != null) 24.h,
          if (rePassword != null)
            TextFormField(
              controller: rePassword,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.newPassword],
              validator: (value) {
                final userInput = value;
                if (userInput != null) {
                  if (userInput.length > 5) {
                    if (password!.text == userInput) return null;
                    return 'Password do not match!';
                  }
                  return 'Weak password, minimum length 6';
                }
                return 'Password must be provided';
              },
              decoration: const InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: Icon(null),
              ),
            ),
        ]),
      ),
    );
  }
}
