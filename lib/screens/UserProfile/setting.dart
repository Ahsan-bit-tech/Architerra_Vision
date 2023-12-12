import 'package:flutter/material.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';
import 'package:flutter_login/constants.dart';

class accountPage extends StatelessWidget {
  static const keyLanguage = "key-location";
  static const keyLocation = "key-language";
  static const keyPassword = 'key-password';

  const accountPage({Key? key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => usersettings(context),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.person, color: Colors.black),
                SizedBox(width: 16),
                Text(
                  "Account Settings",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );

  Widget usersettings(BuildContext context) => Container(
        child: SettingsScreen(
          title: "Account Setting",
          children: <Widget>[
            buildPassword(context),
            buildPrivacy(context),
            buildAccountInfo(context),
          ],
        ),
      );

  Widget buildPassword(BuildContext context) => TextInputSettingsTile(
        title: "Password",
        settingKey: keyPassword,
        obscureText: true,
        leading: const Icon(
          Icons.password,
          color: Colors.blue,
        ),
        validator: (password) => password != null && password.length >= 8
            ? null
            : "Enter 8 Characters",
      );
  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: "Privacy",
        subtitle: '',
        leading: const Icon(
          Icons.lock,
          color: Colors.blue,
        ),
        onTap: () => showSnackBar(context, "Click Privacy"),
      );

  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
        title: "Security",
        subtitle: '',
        leading: const Icon(
          Icons.security,
          color: Colors.blue,
        ),
        onTap: () => showSnackBar(context, "Click Security"),
      );

  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
        title: "Account Info",
        subtitle: '',
        leading: const Icon(
          Icons.text_snippet,
          color: Colors.blue,
        ),
        onTap: () => showSnackBar(context, "Click Account Info"),
      );

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
