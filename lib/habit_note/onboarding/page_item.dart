import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/onboarding_info.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageItem extends StatelessWidget {
  final OnboardingInfo info;
  const PageItem({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        28.h,
        SvgPicture.asset(info.image),
        4.h,
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          title: Text(
            info.title,
          ),
          subtitle: Text(
            info.subtitle,
          ),
        )
      ],
    );
  }
}
