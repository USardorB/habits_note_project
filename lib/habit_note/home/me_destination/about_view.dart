import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

class AboutView extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => AboutView());
  }

  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: primaryColor),
            child: Image.asset('assets/images/logo.png', height: 190, scale: 2),
          ),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 42),
            child: Column(
              children: [
                pageItem(context, () {}, 'Application', 'HaBIT Note'),
                pageItem(context, () {}, 'Version', 'V1.0.0'),
                pageItem(context, () {}, 'Privacy Policy'),
                pageItem(context, () {}, 'Terms of Use'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton pageItem(
    BuildContext context,
    void Function() onTap,
    String title, [
    String? trailing,
  ]) {
    return MaterialButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(trailing ?? '', style: context.textTheme.bodySmall),
        ],
      ),
    );
  }
}
