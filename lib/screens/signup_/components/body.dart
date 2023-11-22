import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/signup_/components/background.dart';
import 'package:flutter_login/screens/login_/login_screen.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';
// import 'package:flutter_login/screens/signup_/signup_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final PassController = TextEditingController();
  bool passtoggle = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGN UP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Image.asset(
                "images/Logo.png",
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
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be empty";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29)),
                child: TextFormField(
                  controller: PassController,
                  obscureText: passtoggle,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          passtoggle = !passtoggle;
                        });
                      },
                      child: Icon(
                          passtoggle ? Icons.visibility : Icons.visibility_off),
                    ),
                    // suffix: Icon(
                    //   Icons.visibility,
                    //   color: kPrimaryColor,
                    // ),
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
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_formfield.currentState!.validate()) {
                        // Email is valid, perform login logic
                        print("Success");
                        emailController.clear();
                        PassController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Input_Screen();
                            },
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "SIGN UP",
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
                    "Already have an Account ? ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                      onTap: () {
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
                        "LOGIN ",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      )),
                ],
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
                  GestureDetector(
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
                  ),
                  GestureDetector(
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
                  ),
                  GestureDetector(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
