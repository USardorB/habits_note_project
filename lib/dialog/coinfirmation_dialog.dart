import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';
import 'package:flutter_application_1/enum/confirmation_dialog_type.dart';
import 'package:flutter_application_1/extension/build_context.dart';

Future<bool> showConfirmationDialog(
  BuildContext context,
  ConfirmationDialogType type,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(type.title),
        content: Text(type.prompt),
        contentTextStyle: context.textTheme.bodySmall,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              foregroundColor: inputFieldColor.withOpacity(0.26),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: inputFieldColor.withOpacity(0.26)),
              ),
              maximumSize: Size(125, 42),
            ),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              maximumSize: Size(125, 42),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(type.actionText),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
