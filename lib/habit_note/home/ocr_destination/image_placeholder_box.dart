import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePlaceholderBox extends StatelessWidget {
  const ImagePlaceholderBox({
    super.key,
    required StreamController<XFile?> imageStreamController,
  }) : _imageStreamController = imageStreamController;

  final StreamController<XFile?> _imageStreamController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: StreamBuilder<XFile?>(
            stream: _imageStreamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return Image.file(File(snapshot.data!.path));
                }
              }
              return Text(
                'Upload an image using the “+” button',
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ),
    );
  }
}
