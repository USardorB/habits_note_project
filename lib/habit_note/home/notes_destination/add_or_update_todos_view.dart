import 'package:flutter/material.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/vertical_more_button.dart';

class AddOrUpdateTodosView extends StatefulWidget {
  const AddOrUpdateTodosView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const AddOrUpdateTodosView(),
      );

  @override
  State<AddOrUpdateTodosView> createState() => _AddOrUpdateTodosViewState();
}

class _AddOrUpdateTodosViewState extends State<AddOrUpdateTodosView> {
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
        actions: [
          VerticalMoreBtton(onColorSelected: (x) => changeColor(x)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: _task,
              style: const TextStyle(fontSize: 23),
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
                hintStyle: const TextStyle(fontSize: 23),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
            ...tasks.map(
              (e) => ListTile(
                leading: Checkbox(value: false, onChanged: (ad) {}),
                title: Text(e),
              ),
            )
          ],
        ),
      ),
    );
  }
}
