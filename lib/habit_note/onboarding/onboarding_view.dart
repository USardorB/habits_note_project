import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/dialog/coinfirmation_dialog.dart';
import 'package:flutter_application_1/enum/confirmation_dialog_type.dart';
import 'package:flutter_application_1/enum/onboarding_info.dart';
import 'package:flutter_application_1/extension/build_context.dart';
import 'package:flutter_application_1/extension/sized_box.dart';
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
  late final PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final bool shouldPop = await showConfirmationDialog(
          context,
          ConfirmationDialogType.exit,
        );
        if (context.mounted && shouldPop) SystemNavigator.pop(animated: true);
      },
      child: Scaffold(
        appBar: AppBar(),
        drawer: const OnboardingDrawer(),
        body: Column(
          children: [
            Column(children: [
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
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() => index = value);
                  },
                  children: const [
                    PageItem(info: OnboardingInfo.note),
                    PageItem(info: OnboardingInfo.todo),
                    PageItem(info: OnboardingInfo.ocr),
                  ],
                ),
              ),
              PageIndicator(
                index: index,
                onTap: (i) {
                  index = i;
                  _controller.animateToPage(
                    index,
                    duration: Durations.extralong3,
                    curve: Curves.linearToEaseOut,
                  );
                  setState(() {});
                },
              ),
              40.h,
              ElevatedButton(
                onPressed: () => Navigator.push(context, RegisterView.route()),
                child: const Text('CREATE ACCOUNT'),
              ),
              24.h,
              ElevatedButton(
                onPressed: () => Navigator.push(context, LogInView.route()),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  foregroundColor: primaryColor,
                ),
                child: const Text('LOG IN'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
