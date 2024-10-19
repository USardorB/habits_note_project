import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/confirmation_dialog_type.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

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
        contentTextStyle: context.textTheme.bodySmall!.copyWith(
          color: context.appColors.onSurface,
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.appColors.secondary,
              foregroundColor: context.appColors.onSurface,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(),
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
