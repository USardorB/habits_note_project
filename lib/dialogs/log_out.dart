import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/onboarding/onboarding_view.dart';

Future<void> logOut(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Log out'),
        content: Text('Are you sure you want to log out?'),
        contentTextStyle: context.textTheme.bodySmall,
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              foregroundColor: inputFieldColor.withOpacity(0.26),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: inputFieldColor.withOpacity(0.26)),
              ),
              maximumSize: Size(125, 42),
            ),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              OnboardingView.route(),
              (route) => false,
            ),
            style: ElevatedButton.styleFrom(
              maximumSize: Size(125, 42),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Log out'),
          ),
        ],
      );
    },
  );
}
