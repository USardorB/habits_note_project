import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/widgets/vertical_more_button.dart';
import 'package:flutter_application_1/services/storage/bloc/storage_bloc.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrUpdateTodoView extends StatefulWidget {
  final int? id;
  const AddOrUpdateTodoView({super.key, this.id});

  static Route route([int? id]) {
    return MaterialPageRoute(builder: (context) => AddOrUpdateTodoView(id: id));
  }

  @override
  State<AddOrUpdateTodoView> createState() => _AddOrUpdateTodoViewState();
}

class _AddOrUpdateTodoViewState extends State<AddOrUpdateTodoView> {
  late final TextEditingController _task;
  int _color = 0;
  List<String> tasks = [];

  @override
  void initState() {
    _task = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _task.dispose();
    super.dispose();
  }

  // void saveNoteIfNotEmpty(BuildContext context) {
  //   context.read<StorageBloc>().add(
  //         StorageEventCreateOrUpdate(
  //           NoteModel(
  //             id: widget.id ?? 0,
  //             isToDo: false,
  //             title: _title.text,
  //             isSyncedWithCloud: false,
  //             description: _description.text,
  //             colorCode: _color,
  //             creationDate: 'Today',
  //           ),
  //         ),
  //       );
  // }

  void changeColor(int x) => setState(() => _color = x);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // saveNoteIfNotEmpty(context);
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add To-do'),
          actions: [
            VerticalMoreBtton(
              id: widget.id ?? -1,
              onColorSelected: (x) => changeColor(x),
              deleteNote: (p0) {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              TextField(
                controller: _task,
                decoration: InputDecoration(
                  icon: IconButton(
                    onPressed: () {
                      if (_task.text.isNotEmpty) {
                        tasks.add(_task.text);
                        _task.clear();
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                  hintText: 'Type something...',
                  hintStyle: context.textTheme.titleSmall,
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),
              ...tasks.map(
                (e) => ListTile(
                  leading: IconButton(
                    onPressed: () {
                      tasks.remove(e);
                      setState(() {});
                    },
                    icon: Icon(Icons.remove),
                  ),
                  title: Text(e),
                  titleTextStyle: context.textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
