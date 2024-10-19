import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';

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
        backgroundColor: context.appColors.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: context.appColors.primary),
            child: Image.asset(logo, height: 190, scale: 2),
          ),
          28.h,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 42),
            child: Column(
              children: [
                pageItem(context, 'Application', 'HaBIT Note'),
                20.h,
                pageItem(context, 'Version', 'V1.0.0'),
                20.h,
                pageItem(context, 'Privacy Policy', null, () {}),
                20.h,
                pageItem(context, 'Terms of Use', null, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell pageItem(
    BuildContext context,
    String title, [
    String? trailing,
    void Function()? onTap,
  ]) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            trailing ?? '',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.appColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
