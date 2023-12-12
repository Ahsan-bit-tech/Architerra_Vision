// import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'dart:async';

// class ContactForm extends StatefulWidget {
//   const ContactForm({Key? key}) : super(key: key);

//   @override
//   State<ContactForm> createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Contact Us",
//           style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//         ),
//         foregroundColor: Colors.white,
//         backgroundColor: const Color(0xFF00838F),
//       ),
//       backgroundColor: Color(0xffeeeeee),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text("In case of a query, feel free to contact us",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: <Widget>[
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: "Name",
//                       border: InputBorder.none,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Enter your name";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 8.0),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: "Email",
//                       border: InputBorder.none,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Enter a valid email";
//                       }
//                       // You can add more sophisticated email validation logic if needed
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 8.0),
//                   TextFormField(
//                     controller: messageController,
//                     maxLines: 7,
//                     decoration: const InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: "Message",
//                       border: InputBorder.none,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Enter your message";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20.0),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(
//                         20), // Adjust the radius as needed
//                     child: MaterialButton(
//                       height: 60,
//                       minWidth: 160,
//                       color: Color(0xFF00838F),
//                       onPressed: () {
//                         // Validate form
//                         if (_formKey.currentState?.validate() ?? false) {
//                           // If validation passes, handle form submission
//                           _submitForm();
//                         }
//                       },
//                       child: Text(
//                         "Submit",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _submitForm() async {
//     print("Form submitted!");
//     print("Name: ${nameController.text}");
//     print("Email: ${emailController.text}");
//     print("Message: ${messageController.text}");

//     // Replace these values with your own SMTP server details
//     final String username = 'f201126@cfd.nu.edu.pk';
//     final String password = 'hmza369036'; // Use App Password for Gmail

//     final smtpServer = gmail(username, password);

//     final message = Message()
//       ..from = Address(username, 'Ahsan')
//       ..recipients.add(
//           'ahsan.kaukab2000@gmail.com') // Replace with your developer email
//       ..subject = 'Contact Form Submission'
//       ..text = '''
//         Name: ${nameController.text}
//         Email: ${emailController.text}
//         Message: ${messageController.text}
//       ''';

//     try {
//       await Future.delayed(Duration.zero); // Allow the UI to update
//       final sendReport = await send(message, smtpServer);
//       print('Message sent: ' + sendReport.toString());
//       // Provide feedback to the user (e.g., show a success message)
//       _showSuccessDialog();
//     } catch (e) {
//       print('Message not sent. $e');
//       // Provide feedback to the user (e.g., show an error message)
//       _showErrorDialog();
//     }
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Thanks for Contacting Us!"),
//           content: Text("We appreciate your message."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text("Message could not be sent. Please try again later."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
