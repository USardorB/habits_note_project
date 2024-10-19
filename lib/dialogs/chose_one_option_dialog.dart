import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/option_dialog_type.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

Future<int?> showChoseOneOptionDialog(
  BuildContext context,
  OptionDialogType type,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(type.title, textAlign: TextAlign.center),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
            leading: const Icon(Icons.keyboard, size: 36),
            title: Text(type.option1),
            titleTextStyle: context.textTheme.titleSmall,
            onTap: () => Navigator.pop(context, 1),
          ),
          ListTile(
            leading: const Icon(Icons.check_box, size: 36),
            title: Text(type.option2),
            titleTextStyle: context.textTheme.titleSmall,
            onTap: () => Navigator.pop(context, 2),
          ),
        ]),
      );
    },
  );
}
