import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/color_plate.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/views/add_or_update_note_view.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/views/add_or_update_todos_view.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';

class NotesItem extends StatelessWidget {
  final NoteModel note;
  const NotesItem({super.key, required this.note});

  bool get isNote => !note.isNote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: colorPlate[note.colorCode],
        border: note.colorCode == 0 ? Border.all() : null,
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          isNote
              ? AddOrUpdateNoteView.route(note)
              : AddOrUpdateTodoView.route(note.id),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style:
                  context.textTheme.titleSmall?.copyWith(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('3 days ago', style: context.textTheme.bodySmall),
              ],
            )
          ],
        ),
      ),
    );
  }
}
