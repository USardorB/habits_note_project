import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(color: primaryColor),
            child: SizedBox(
              height: 200,
              child: Center(
                  child: Text(
                'User Guide',
                style: TextStyle(fontSize: 48, color: secondaryColor),
              )),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(14),
              leading: Icon(Icons.sticky_note_2, size: 60, color: Colors.white),
              title: Text(
                'Notes',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                'Tap to view',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(14),
              leading: Icon(Icons.image_search, size: 60, color: Colors.white),
              title: Text(
                'OCR',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                'Tap to view',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(14),
              leading: Icon(Icons.lock, size: 60, color: Colors.white),
              title: Text(
                'Reset Password',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                'Tap to view',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
