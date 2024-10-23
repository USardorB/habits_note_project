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
    List<NoteModel> oddSide = [];
    List<NoteModel> evenSide = [];

    for (var i = 0; i < notes.length; i++) {
      if (i % 2 == 0) {
        oddSide.add(notes[i]);
      } else {
        evenSide.add(notes[i]);
      }
    }

    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            isGirdView ? 2 : 1,
            (i) {
              return Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    isGirdView ? [oddSide, evenSide][i].length : notes.length,
                    (j) => NotesItem(
                      note: isGirdView ? [oddSide, evenSide][i][j] : notes[j],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
