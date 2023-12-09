import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/login_/login_screen.dart';
import 'package:flutter_login/screens/welcome/components/background.dart';
import 'package:flutter_login/screens/signup_/signup_screen.dart';
import 'package:flutter_login/services/firebase_services.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/Logo.png",
              width: size.width * 0.3,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: kPrimaryLightColor,
                      foregroundColor: const Color.fromARGB(255, 6, 181, 181)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),

      ),
    );
  }
}
