import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/extension/build_context.dart';
import 'package:flutter_application_1/extension/sized_box.dart';
import 'package:flutter_application_1/habit_note/auth/forgot_password/forgot_password_view.dart';

class OnboardingDrawer extends StatelessWidget {
  const OnboardingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xffF1F1F1).withOpacity(0.5), primaryColor],
            stops: const [0.15, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            84.h,
            ListTile(
              title: Text('HaBIT Note'),
              titleTextStyle: context.textTheme.titleSmall!.copyWith(
                fontFamily: 'FugazOne',
              ),
              subtitle: Text('V1.0.0'),
              contentPadding: EdgeInsets.only(left: 60),
              shape: UnderlineInputBorder(),
            ),
            ListTile(
              title: Text(
                'Forgot Password',
                style: context.textTheme.bodyMedium,
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () => Navigator.push(context, ForgotPasswordView.route()),
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: context.textTheme.bodyMedium,
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Terms of Use',
                style: context.textTheme.bodyMedium,
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
