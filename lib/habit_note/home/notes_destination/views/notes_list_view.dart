import 'package:flutter/material.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/widgets/notes_item.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';

class NotesListView extends StatelessWidget {
  final List<NoteModel> notes;
  final bool isGirdView;

  const NotesListView({
    super.key,
    required this.notes,
    required this.isGirdView,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        isGirdView ? 2 : 1,
        (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NotesItem(note: notes[index]),
            ],
          );
        },
      ),
    );
  }
}
