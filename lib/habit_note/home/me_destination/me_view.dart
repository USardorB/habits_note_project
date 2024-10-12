import 'package:flutter/material.dart';

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
          const ListTile(
            contentPadding: EdgeInsets.only(left: 48),
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 48),
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('LOG OUT'),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
