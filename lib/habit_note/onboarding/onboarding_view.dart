import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/enums/onboarding.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/auth/login/login_view.dart';
import 'package:flutter_application_1/habit_note/auth/register/register_view.dart';
import 'package:flutter_application_1/habit_note/onboarding/drawer.dart';
import 'package:flutter_application_1/habit_note/onboarding/page_indictator.dart';
import 'package:flutter_application_1/habit_note/onboarding/page_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => OnboardingView());

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      drawer: const OnboardingDrawer(),
      body: Column(
        children: [
          Column(
            children: [
              ListTile(
                title: Text('WELCOME TO'),
                titleTextStyle: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
                subtitle: Text('HaBIT Note'),
                subtitleTextStyle: context.textTheme.bodyMedium!.copyWith(
                  fontFamily: 'FugazOne',
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 32),
              ),
              SizedBox(
                height: 470,
                child: PageView(
                  onPageChanged: (value) => setState(() => index = value),
                  children: const [
                    PageItem(info: OnboardingInfo.note),
                    PageItem(info: OnboardingInfo.todo),
                    PageItem(info: OnboardingInfo.ocr),
                  ],
                ),
              ),
              PageIndicator(index: index),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(context, RegisterView.route()),
                child: const Text('CREATE ACCOUNT'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.push(context, LogInView.route()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  foregroundColor: primaryColor,
                ),
                child: const Text('LOG IN'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
