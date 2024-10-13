import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

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
            const SizedBox(height: 84),
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
              title: const Text(
                'Forgot Password',
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Privacy Policy',
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Terms of Use',
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
