import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/widgets/vertical_more_button.dart';
import 'package:flutter_application_1/services/storage/bloc/storage_bloc.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrUpdateNoteView extends StatefulWidget {
  final int? id;
  const AddOrUpdateNoteView({super.key, this.id});
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
      backgroundColor: context.appColors.onError,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<StorageBloc>().add(
                    StorageEventCreateOrUpdate(
                      NoteModel(
                        id: widget.id ?? 0,
                        isToDo: false,
                        title: _title.text,
                        isSyncedWithCloud: false,
                        description: _description.text,
                        colorCode: _color,
                        creationDate: 'Today',
                      ),
                    ),
                  );
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
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
    );
  }
}
