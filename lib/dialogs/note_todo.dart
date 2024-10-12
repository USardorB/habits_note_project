import 'package:flutter/material.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/add_or_update_note_view.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/add_or_update_todos_view.dart';

Future<void> showTypeDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('New', textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.keyboard, size: 36),
              title: const Text(
                'Add note',
                style: TextStyle(fontSize: 24),
              ),
              onTap: () => Navigator.pushReplacement(
                  context, AddOrUpdateNoteView.route()),
            ),
            ListTile(
              leading: const Icon(Icons.check_box, size: 36),
              title: const Text(
                'Add to-do',
                style: TextStyle(fontSize: 24),
              ),
              onTap: () => Navigator.pushReplacement(
                context,
                AddOrUpdateTodosView.route(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
