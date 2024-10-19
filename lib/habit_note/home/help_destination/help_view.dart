import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        titleTextStyle: context.textTheme.headlineLarge,
        elevation: 0,
        backgroundColor: context.appColors.primary,
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: context.appColors.primary),
            child: SizedBox(
              height: 200,
              child: Center(
                child:
                    Text('User Guide', style: context.textTheme.displayLarge),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
            decoration: BoxDecoration(
              color: context.appColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(14),
              leading: Icon(Icons.sticky_note_2, size: 60, color: Colors.white),
              title: Text(
                'Notes',
              ),
              subtitle: Text(
                'Tap to view',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
            decoration: BoxDecoration(
              color: context.appColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(14),
              leading: Icon(Icons.image_search, size: 60, color: Colors.white),
              title: Text(
                'OCR',
              ),
              subtitle: Text(
                'Tap to view',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 42),
            decoration: BoxDecoration(
              color: context.appColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(14),
              leading: Icon(Icons.lock, size: 60, color: Colors.white),
              title: Text(
                'Reset Password',
              ),
              subtitle: Text(
                'Tap to view',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
