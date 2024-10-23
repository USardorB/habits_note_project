import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/widgets/vertical_more_button.dart';
import 'package:flutter_application_1/services/storage/bloc/storage_bloc.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrUpdateNoteView extends StatefulWidget {
  final NoteModel? note;
  const AddOrUpdateNoteView({super.key, this.note});
  static Route route([NoteModel? n]) {
    return MaterialPageRoute(
        builder: (context) => AddOrUpdateNoteView(note: n));
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
    if (widget.note == null) {
      _title = TextEditingController();
      _description = TextEditingController();
    } else {
      _title = TextEditingController(text: widget.note?.title);
      _description = TextEditingController(text: widget.note?.description);
      _color = widget.note?.colorCode ?? 0;
    }
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  void changeColor(int x) => setState(() => _color = x);

  void saveNoteIfNotEmpty(BuildContext context) {
    context.read<StorageBloc>().add(
          StorageEventCreateOrUpdate(
            NoteModel(
              id: widget.note?.id ?? 0,
              isNote: false,
              title: _title.text,
              isSyncedWithCloud: false,
              description: _description.text,
              colorCode: _color,
              creationDate: 'Today',
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        saveNoteIfNotEmpty(context);
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: context.appColors.onError,
        appBar: AppBar(
          title: const Text('Add Note'),
          actions: [
            VerticalMoreBtton(
              id: widget.note?.id ?? -1,
              onColorSelected: (x) => changeColor(x),
              deleteNote: (id) {
                if (id != -1) {
                  context.read<StorageBloc>().add(StorageEventDelete(id));
                }
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
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
            Expanded(
              child: TextField(
                controller: _description,
                maxLines: 10,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'Type something...',
                  hintStyle: context.textTheme.titleSmall,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
