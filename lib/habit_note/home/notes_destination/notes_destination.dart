import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/dialogs/filter.dart';
import 'package:flutter_application_1/dialogs/note_todo.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({super.key});

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        titleTextStyle: context.textTheme.headlineLarge,
        actions: [
          IconButton(
            onPressed: () async {
              color = await showColorFilter(context);
              setState(() {});
            },
            icon: Icon(
              Icons.color_lens,
              color: color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view),
            selectedIcon: const Icon(Icons.view_stream),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showTypeDialog(context);
        },
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        child: const Icon(Icons.add, size: 48),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            'assets/images/rafiki.svg',
            alignment: AlignmentDirectional.center,
          ),
          const SizedBox(height: 36),
          const Text(
            'Create your first note !',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
