import 'package:flutter_application_1/const/images.dart';

enum OnboardingInfo {
  note(
    image: onboarding1,
    title: 'Take Notes',
    subtitle: 'Quickly capture what’s on your mind',
  ),
  todo(
    image: onboarding2,
    title: 'To-dos',
    subtitle: 'List out your day-to-day tasks',
  ),
  ocr(
    image: onboarding3,
    title: 'Image to Text Converter',
    subtitle: 'Upload your images and convert to text',
  );

  final String image;
  final String title;
  final String subtitle;

  const OnboardingInfo({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
