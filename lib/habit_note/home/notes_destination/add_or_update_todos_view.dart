import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/vertical_more_button.dart';

class AddOrUpdateTodoView extends StatefulWidget {
  const AddOrUpdateTodoView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const AddOrUpdateTodoView(),
      );

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

  void changeColor(int x) => setState(() => _color = x);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To-do'),
        actions: [VerticalMoreBtton(onColorSelected: (x) => changeColor(x))],
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
    );
  }
}
