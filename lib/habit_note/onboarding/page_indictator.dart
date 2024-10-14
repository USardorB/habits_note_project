import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';

class PageIndicator extends StatelessWidget {
  final int index;
  const PageIndicator({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: index == this.index ? primaryColor : secondaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: index == this.index
              ? const EdgeInsets.symmetric(horizontal: 32, vertical: 8)
              : const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
