import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/login_/components/background.dart';
import 'package:flutter_login/screens/signup_/signup_screen.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
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
              const Text(
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
                  const Text(
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
      ),
    );
  }
} 

// class TextFieldContainer extends StatelessWidget {
//   const TextFieldContainer({
//     super.key,
//     Key key
//     });

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }