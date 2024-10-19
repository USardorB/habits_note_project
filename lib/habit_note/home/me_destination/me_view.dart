import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/dialogs/coinfirmation_dialog.dart';
import 'package:flutter_application_1/enums/confirmation_dialog_type.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/extensions/sized_box.dart';
import 'package:flutter_application_1/habit_note/home/me_destination/about_view.dart';
import 'package:flutter_application_1/habit_note/home/me_destination/settings_view.dart';

class MeView extends StatelessWidget {
  const MeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me'),
        titleTextStyle: context.textTheme.headlineLarge,
      ),
      body: Column(
        children: [
          Row(
            children: [
              40.w,
              Image.asset(profilePic, scale: 1.2),
              10.w,
              const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('JohnDoe'),
                    Text('yourmail@gmail.com'),
                  ])
            ],
          ),
          36.h,
          const Divider(),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 48),
            leading: Icon(Icons.archive),
            title: Text('Archive notes'),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 48),
            onTap: () => Navigator.push(context, SettingsView.route()),
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 48),
            onTap: () => Navigator.push(context, AboutView.route()),
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
          24.h,
          ElevatedButton.icon(
            onPressed: () async {
              await showConfirmationDialog(
                context,
                ConfirmationDialogType.logout,
              );
            },
            label: const Text('LOG OUT'),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
