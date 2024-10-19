import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

class PageIndicator extends StatelessWidget {
  final int index;
  final void Function(int i) onTap;
  const PageIndicator({super.key, required this.index, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () => onTap(index),
          child: AnimatedContainer(
            curve: Easing.emphasizedAccelerate,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: index == this.index
                  ? context.appColors.primary
                  : context.appColors.surface,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: index == this.index
                ? const EdgeInsets.symmetric(horizontal: 32, vertical: 8)
                : const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
