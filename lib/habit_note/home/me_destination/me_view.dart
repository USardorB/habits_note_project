import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialogs/log_out.dart';
import 'package:flutter_application_1/habit_note/home/me_destination/about_view.dart';
import 'package:flutter_application_1/habit_note/home/me_destination/settings_view.dart';

class MeView extends StatelessWidget {
  const MeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 40),
              Image.asset('assets/images/profile_pic.png', scale: 1.2),
              const SizedBox(width: 10),
              const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('JohnDoe'),
                    Text('yourmail@gmail.com'),
                  ])
            ],
          ),
          const SizedBox(height: 36),
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
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () async {
              await logOut(context);
            },
            label: const Text('LOG OUT'),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
