import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotesView extends StatelessWidget {
  const EmptyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          noNotes,
          alignment: AlignmentDirectional.center,
        ),
        36.h,
        const Text(
          'Create your first note !',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
