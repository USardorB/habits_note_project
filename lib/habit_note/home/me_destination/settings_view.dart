import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/enums/app_theme_modes.dart';
import 'package:flutter_application_1/extensions/build_context.dart';
import 'package:flutter_application_1/extensions/string.dart';

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
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 48),
            leading: Icon(Icons.mode_night),
            title: Text('App Theme'),
            trailing: PopupMenuButton<ThemeMode>(
              onSelected: (value) {
                HabitNoteApp.of(context).changeTheme(value);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Theme.of(context).brightness.name.capitalize,
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: context.appColors.onSurface)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: ThemeMode.system,
                    child: Text(AppThemeModes.system.text),
                  ),
                  PopupMenuItem(
                    value: ThemeMode.light,
                    child: Text(AppThemeModes.light.text),
                  ),
                  PopupMenuItem(
                    value: ThemeMode.dark,
                    child: Text(AppThemeModes.dark.text),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
