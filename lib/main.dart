import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
//import 'package:flutter_login/screens/welcome/welcome_screen.dart';
import 'package:flutter_login/screens/generated_Images/background.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';
import 'package:flutter_login/screens/welcome/welcome_screen.dart';
import 'package:flutter_login/screens/onboarding_screen/onboarding_screen.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arciterra',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OnBoardingScreen(),
      // home: WelcomeScreen(),
    );
  }
}
