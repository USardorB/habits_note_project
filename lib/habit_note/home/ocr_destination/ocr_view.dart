import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/dialogs/chose_one_option_dialog.dart';
import 'package:flutter_application_1/enums/option_dialog_type.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_application_1/habit_note/home/ocr_destination/image_placeholder_box.dart';
import 'package:flutter_application_1/habit_note/home/ocr_destination/text_placeholder_pbox.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class OcrView extends StatefulWidget {
  const OcrView({super.key});

  @override
  State<OcrView> createState() => _OcrViewState();
}

class _OcrViewState extends State<OcrView> {
  final ImagePicker picker = ImagePicker();
  late final StreamController<XFile?> _imageStreamController;
  late final StreamController<String?> _textStreamController;
  XFile? myImage;
  String clipBoardText = '';

  @override
  void initState() {
    _imageStreamController = StreamController<XFile?>.broadcast();
    _textStreamController = StreamController<String?>.broadcast();
    super.initState();
  }

  @override
  void dispose() {
    _imageStreamController.close();
    _textStreamController.close();
    super.dispose();
  }

  Future<void> pickImage(ImageSource source) async {
    myImage = await picker.pickImage(source: source);
    _imageStreamController.sink.add(myImage);
  }

  Future<void> recognizeText(XFile? image) async {
    if (image == null) return;

    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    clipBoardText = recognizedText.text;
    _textStreamController.sink.add(clipBoardText);
  }

  Future<void> copyResult(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: clipBoardText));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          width: 120,
          duration: Durations.long1,
          padding: EdgeInsets.all(10),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          content: Text('Text copied'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image to Text'),
        titleTextStyle: context.textTheme.headlineLarge,
        actions: [
          IconButton(
            onPressed: () async => await copyResult(context),
            icon: const Icon(Icons.copy),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final x = await showChoseOneOptionDialog(
            context,
            OptionDialogType.imagePicker,
          );
          if (x == 1) await pickImage(ImageSource.camera);
          if (x == 2) await pickImage(ImageSource.gallery);
        },
        shape: const CircleBorder(),
        backgroundColor: context.appColors.primary,
        foregroundColor: context.appColors.surface,
        child: const Icon(Icons.add, size: 48),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            ImagePlaceholderBox(imageStreamController: _imageStreamController),
            24.h,
            TextPlaceholderBox(textStreamController: _textStreamController),
            42.h,
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    _imageStreamController.sink.add(null);
                    _textStreamController.sink.add(null);
                  },
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(side: BorderSide()),
                    foregroundColor: context.appColors.onSurface,
                  ),
                  child: const Text(
                    'Clear Image',
                  ),
                ),
                14.w,
                TextButton(
                  onPressed: () {
                    if (myImage != null) {
                      recognizeText(myImage);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: context.appColors.primary,
                    foregroundColor: context.appColors.surface,
                  ),
                  child: const Text(
                    'Scan Image',
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
