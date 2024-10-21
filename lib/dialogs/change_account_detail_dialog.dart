import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

Future<int?> showChoseOneOptionDialog(
  BuildContext context,
  AccountDetail type,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      final _contoller = TextEditingController();
      return AlertDialog(
        title: Text('Update account', textAlign: TextAlign.center),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: _contoller,
          ),
          Text(type.massage),
        ]),
        actions: [
          ElevatedButton(
            onPressed: () {
              // context.read<AuthBloc>().add();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.appColors.secondary,
              foregroundColor: context.appColors.onSurface,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(),
              ),
              maximumSize: Size(125, 42),
            ),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              maximumSize: Size(125, 42),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}

enum AccountDetail {
  name('Enter a new name for this profile'),
  email('Enter new email');

  final String massage;

  const AccountDetail(this.massage);
}
