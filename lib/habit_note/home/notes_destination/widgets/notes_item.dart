import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/color_plate.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';

class NotesItem extends StatelessWidget {
  final NoteModel note;
  const NotesItem({super.key, required this.note});

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
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(note.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('3 days ago'),
          ],
        )
      ]),
    );
  }
}
