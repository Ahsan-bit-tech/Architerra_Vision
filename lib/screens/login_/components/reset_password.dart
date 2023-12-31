import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/reusable_widgets/reusable_widgets.dart';
import 'package:flutter_login/screens/BluePrints/blueprints.dart';
import 'package:flutter_login/screens/login_/components/background.dart';
import 'package:flutter_login/screens/login_/login_screen.dart';
import 'package:flutter_login/screens/login_/components/reset_password.dart';
import 'package:flutter_login/screens/signup_/signup_screen.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';
import 'package:flutter_login/screens/login_/components/reset_password.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});
  @override
  State<resetPassword> createState() => _bodyState();
}

class _bodyState extends State<resetPassword> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final PassController = TextEditingController();
  bool passtoggle = true;
  bool flag1 =false;
  bool flag2 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        key: _formfield,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.08,
            ),
            const Text(
              "Reset Password",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
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
                    Icons.email_rounded,
                    color: kPrimaryColor,
                  ),
                  hintText: "Enter your Email",
                  border: InputBorder.none,
                ),
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    flag1 = true;
                    return "Email can't be empty";
                  } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value))
                  {
                    flag2 = true;
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            firebaseUIButton(context, "RESET", ()
            {
              FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text)
                  .then((value) { showDialog(context: context, builder: (context)
              {
                return Container(
                  child: AlertDialog(
                    title: Text("Password reset link sent to your email"),
                    actions: [
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.pop(context); // Close the current dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text("Login Again"),
                      ),
                    ],
                  ),
                );
              });
              }).onError((error, stackTrace) {

                showDialog(context: context, builder: (context){
                  return Container(
                    child: AlertDialog(
                      title: Text("Error! Re-enter your Email Correctly"),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("OK"))
                      ],
                    ),
                  );
                });
                print("Error ${error.toString()}");
              });
              print("Success");

            }),
          ],
        ),
      ),
    );
  }

}