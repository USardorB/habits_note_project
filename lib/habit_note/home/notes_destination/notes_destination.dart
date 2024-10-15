import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/const/images.dart';
import 'package:flutter_application_1/dialog/filter_dialog.dart';
import 'package:flutter_application_1/dialog/chose_one_option_dialog.dart';
import 'package:flutter_application_1/enum/option_dialog_type.dart';
import 'package:flutter_application_1/extension/build_context.dart';
import 'package:flutter_application_1/extension/sized_box.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/add_or_update_note_view.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/add_or_update_todos_view.dart';
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
          final option = await showChoseOneOptionDialog(
            context,
            OptionDialogType.editorSelection,
          );
          if (option == 1) Navigator.push(context, AddOrUpdateNoteView.route());
          if (option == 2) Navigator.push(context, AddOrUpdateTodoView.route());
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
            noNotes,
            alignment: AlignmentDirectional.center,
          ),
          36.h,
          const Text(
            'Create your first note !',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
