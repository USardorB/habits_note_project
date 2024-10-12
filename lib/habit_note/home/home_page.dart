import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/habit_note/home/help_destination/help_view.dart';
import 'package:flutter_application_1/habit_note/home/me_destination/me_view.dart';
import 'package:flutter_application_1/habit_note/home/notes_destination/notes_destination.dart';
import 'package:flutter_application_1/habit_note/home/ocr_destination/ocr_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static Route route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [HomeVeiw(), OcrView(), HelpView(), MeView()][index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => index = value),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_search_outlined),
            label: 'OCR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Me',
          ),
        ],
        iconSize: 36,
        backgroundColor: bgColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontSize: 18),
        unselectedLabelStyle: const TextStyle(fontSize: 18),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
