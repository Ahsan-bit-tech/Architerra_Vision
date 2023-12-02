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
            Text(
              "welcome ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
            Container(
              width: size.width * 0.8,
              child: const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Color(0XFFD9D9D9),
                      height: 1.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ),

                  Expanded(
                    child: Divider(
                      color: Color(0XFFD9D9D9),
                      height: 1.5,
                    ),
                  ),
                ],

              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Sign up using',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),

                  ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                GestureDetector(
                  //Connectivity with gmail sigu up
                  onTap: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border:
                        Border.all(width: 2, color: kPrimaryLightColor),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      'images/google.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                /*GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border:
                        Border.all(width: 2, color: kPrimaryLightColor),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      "images/Logo.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),*/
               /* GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border:
                        Border.all(width: 2, color: kPrimaryLightColor),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      "images/Logo.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                )*/
              ],
            ),

          ],
        ),

      ),
    );
  }
}
