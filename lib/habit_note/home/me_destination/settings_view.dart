import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static Route route() => MaterialPageRoute(
        builder: (context) => SettingsView(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 48),
            leading: Icon(Icons.notifications_active),
            title: Text('Sound Effects'),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 48),
            leading: Icon(Icons.mode_night),
            title: Text('Dark Mode'),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
