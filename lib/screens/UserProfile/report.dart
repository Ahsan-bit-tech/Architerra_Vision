import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_login/constants.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ContactFormState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController messageController = TextEditingController();
bool isLoading = true;

class _ContactFormState extends State<ReportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report Us",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF00838F),
      ),
      backgroundColor: Color(0xffeeeeee),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Fill the fields",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a valid email";
                      } else if (!RegExp(
                              r'^[a-z0-9](\.?[a-z0-9]){5,}@gmail\.com$')
                          .hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      // You can add more sophisticated email validation logic if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: messageController,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your issue",
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your message";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the radius as needed
                    child: MaterialButton(
                      height: 60,
                      minWidth: 160,
                      color: Color(0xFF00838F),
                      onPressed: () async {
                        // Validate form
                        if (_formKey.currentState?.validate() ?? false) {
                          // If validation passes, handle form submission
                          setState(() {
                            isLoading = true;
                          });
                          await sendmail();
                          setState(() {
                            isLoading = false;
                          });

                          // Show the response popup
                          await _showResponsePopup();
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showResponsePopup() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thanks for your response'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                nameController.clear();
                emailController.clear();
                messageController.clear();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future sendmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceid = "service_hrtwx9q";
    const templateid = "template_418u5bn";
    const publicKey = "fewCwtKm1-MTo05Vi";
    final response = await http.post(url,
        headers: {'Content-Type': "application/json"},
        body: json.encode({
          "service_id": serviceid,
          "template_id": templateid,
          "user_id": publicKey,
          "template_params": {
            "name": nameController.text,
            "message": messageController.text,
            "user_email": emailController.text,
          }
        }));
    return response.statusCode;
  }
}
