import 'package:flutter/material.dart';
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
            decoration: const InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(fontSize: 48),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 48),
          ),
          TextField(
            controller: _description,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Type something...',
              hintStyle: TextStyle(fontSize: 23),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 23),
          ),
        ],
      ),
    );
  }
}
