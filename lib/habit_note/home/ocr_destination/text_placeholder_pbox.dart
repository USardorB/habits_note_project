import 'dart:async';

import 'package:flutter/material.dart';

class TextPlaceholderBox extends StatelessWidget {
  const TextPlaceholderBox({
    super.key,
    required StreamController<String?> textStreamController,
  }) : _textStreamController = textStreamController;

  final StreamController<String?> _textStreamController;

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
          child: StreamBuilder(
            stream: _textStreamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SelectableText(
                  snapshot.data!,
                );
              }
              return Text(
                'Click the “Scan Image” button to perform scan',
              );
            },
          ),
        ),
      ),
    );
  }
}
