import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/dialogs/take_or_import_pic.dart';

class OcrView extends StatelessWidget {
  const OcrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image to Text'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.copy))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await takeOrUploadPicture(context);
        },
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        child: const Icon(Icons.add, size: 48),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            Flexible(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text('Upload an image using the “+” button'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Flexible(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text('Click the “Scan Image” button to perform scan'),
                ),
              ),
            ),
            const SizedBox(height: 42),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(side: BorderSide()),
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Clear Image',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(width: 14),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: secondaryColor,
                  ),
                  child: const Text(
                    'Scan Image',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
