import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';

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
            const ListTile(
              title: Text(
                'HaBIT Note',
                style: TextStyle(fontFamily: 'FugazOne', fontSize: 24),
              ),
              subtitle: Text('V1.0.0', style: TextStyle(fontSize: 18)),
              contentPadding: EdgeInsets.only(left: 60),
              shape: UnderlineInputBorder(),
            ),
            ListTile(
              title: const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 18),
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 18),
              ),
              contentPadding: const EdgeInsets.only(left: 60),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Terms of Use',
                style: TextStyle(fontSize: 18),
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
