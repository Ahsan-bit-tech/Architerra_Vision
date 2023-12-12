import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/welcome/welcome_screen.dart';
import 'package:flutter_login/screens/generated_Images/background.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';
import 'package:flutter_login/screens/welcome/welcome_screen.dart';
import 'package:flutter_login/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_login/screens/splash_screen/body.dart';
import 'package:flutter_login/screens/UserProfile/body.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';

void main() async {
  runApp(const MyApp());
  await Settings.init(cacheProvider: SharePreferenceCache());

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architerra',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: OnBoardingScreen()
      home: WelcomeScreen(),
      // home: SettingPage(),
    );
  }
}
