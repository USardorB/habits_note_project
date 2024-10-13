import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

Future<void> takeOrUploadPicture(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('New', textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Take photo'),
              titleTextStyle: context.textTheme.titleSmall,
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              titleTextStyle: context.textTheme.titleSmall,
            )
          ],
        ),
      );
    },
  );
}
