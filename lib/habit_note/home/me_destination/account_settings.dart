import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/dialogs/change_account_detail_dialog.dart';
import 'package:flutter_application_1/habit_note/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_application_1/services/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettings extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => AccountSettings());

  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Display Name'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('JohnDoe'), Icon(Icons.keyboard_arrow_right)],
            ),
            onTap: () async {
              showChoseOneOptionDialog(context, AccountDetail.name);
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('yourmail@gmail.com'),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text('Password'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('*********'), Icon(Icons.keyboard_arrow_right)],
            ),
            onTap: () => Navigator.pushReplacement(
              context,
              ForgotPasswordView.route(),
            ),
          ),
          ListTile(
            leading: CircleAvatar(child: Image.asset(profilePic)),
            title: Text('Photo'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          TextButton.icon(
            label: Text('Delete account'),
            icon: Icon(Icons.delete_forever),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () {
              context.read<AuthBloc>().add(AuthEventDeleteAccount());
            },
          )
        ],
      ),
    );
  }
}
