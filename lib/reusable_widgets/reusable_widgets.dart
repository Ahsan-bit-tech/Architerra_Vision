import 'package:flutter/material.dart';

import '../constants.dart';

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  Size size = MediaQuery.of(context).size;
  return Container(
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
          onTap();
         /* if (_formfield.currentState!.validate()) {
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
          }*/
        },
        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}