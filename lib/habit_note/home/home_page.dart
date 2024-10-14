import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/dialog/coinfirmation_dialog.dart';
import 'package:flutter_application_1/enum/confirmation_dialog_type.dart';
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final bool shouldPop = await showConfirmationDialog(
          context,
          ConfirmationDialogType.exit,
        );
        if (context.mounted && shouldPop) SystemNavigator.pop(animated: true);
      },
      child: Scaffold(
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
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
