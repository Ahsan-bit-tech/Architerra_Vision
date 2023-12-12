import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/welcome/welcome_screen.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';
import 'package:flutter_login/screens/UserProfile/setting.dart';
import 'package:flutter_login/screens/UserProfile/report.dart';
import 'package:flutter_login/constants.dart';
import '../UserProfile/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../Dashboard/dashboard.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

final auth = FirebaseAuth.instance;

class _SettingPageState extends State<SettingPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            color: isDarkMode ? Colors.black : Colors.white,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                buildUserHeader(),
                SettingsGroup(
                  title: "General",
                  titleTextStyle: TextStyle(color: Colors.black87),
                  children: <Widget>[
                    buildDarkModeSwitch(),
                    const accountPage(),
                    const Divider(
                      color: Colors.black38,
                      height: 1,
                    ),
                    buildLogout(context),
                    const Divider(
                      color: Colors.black38,
                      height: 1,
                    ),
                    buildDeleteAccount(context),
                  ],
                ),
                const SizedBox(height: 32),
                SettingsGroup(
                  title: "Feedback",
                  titleTextStyle: TextStyle(color: Colors.black87),
                  children: <Widget>[
                    const SizedBox(height: 8),
                    buildReportBug(context),
                    const Divider(
                      color: Colors.black38,
                      height: 1,
                    ),
                    buildSendFeedback(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildDarkModeSwitch() {
    return ListTile(
      title: Text(
        "Dark Mode",
        style: TextStyle(
          color: isDarkMode ? kPrimaryLightColor : Colors.black,
        ),
      ),
      trailing: Switch(
        value: isDarkMode,
        activeColor: kPrimaryLightColor,
        onChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }

  Widget buildUserHeader() {
    final String username = "Ahsan";
    final String email = "f201124@gmail.com";
    final String userImagePath = "images/Logo.png";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(userImagePath),
        ),
        SizedBox(height: 16),
        Text(
          username,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? kPrimaryColor : Colors.black,
          ),
        ),
        Text(
          email,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildLogout(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            _showLogoutConfirmation();
          },
          child: const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.logout, color: Colors.red),
                SizedBox(width: 16),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildDeleteAccount(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            showSnackBar(context, "Clicked Delete Account");
          },
          child: const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.delete, color: Colors.black),
                SizedBox(width: 16),
                Text(
                  "Delete Account",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildReportBug(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportPage(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.bug_report, color: Colors.black),
                SizedBox(width: 16),
                Text(
                  "Report a bug",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildSendFeedback(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => showSnackBar(context, "Clicked Send Feedback"),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.black),
                SizedBox(width: 16),
                Text(
                  "Send Feedback",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _showLogoutConfirmation() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add your logout logic here
                // For now, let's just navigate to the login page and clear the stack
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );

                // Show "Logged Out" message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged Out'),
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
