import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/onboarding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageItem extends StatelessWidget {
  final OnboardingInfo info;
  const PageItem({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28),
        SvgPicture.asset(info.image),
        const SizedBox(height: 4),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          title: Text(
            info.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            info.subtitle,
            style: const TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
