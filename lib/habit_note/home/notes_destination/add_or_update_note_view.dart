import 'package:flutter/material.dart';
import 'package:flutter_application_1/extension/build_context.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/vertical_more_button.dart';

class AddOrUpdateNoteView extends StatefulWidget {
  const AddOrUpdateNoteView({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const AddOrUpdateNoteView());
  }

  @override
  State<AddOrUpdateNoteView> createState() => _AddOrUpdateNoteViewState();
}

class _AddOrUpdateNoteViewState extends State<AddOrUpdateNoteView> {
  late final TextEditingController _title;
  late final TextEditingController _description;
  int _color = 0;

  @override
  void initState() {
    _title = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  void changeColor(int x) => setState(() => _color = x);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          VerticalMoreBtton(onColorSelected: (x) => changeColor(x)),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _title,
            style: context.textTheme.headlineLarge,
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: context.textTheme.displayLarge,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          TextField(
            controller: _description,
            maxLines: null,
            minLines: 15,
            decoration: InputDecoration(
              hintText: 'Type something...',
              hintStyle: context.textTheme.titleSmall,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
