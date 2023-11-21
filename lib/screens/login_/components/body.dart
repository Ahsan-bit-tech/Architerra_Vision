import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/login_/components/background.dart';
import 'package:flutter_login/screens/signup_/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    // required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "images/signup.png",
              width: size.width * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29)),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  hintText: "Your Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29)),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
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
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account ? ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                    onTap: () {
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
                      "Sign Up",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
