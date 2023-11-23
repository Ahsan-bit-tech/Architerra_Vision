import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
// import 'package:flutter_login/screens/welcome/welcome_screen.dart';
import 'package:flutter_login/screens/BluePrints/components/sidebar.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';
import 'package:flutter_login/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
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
      home: Input_Screen(),
    );
  }
}
