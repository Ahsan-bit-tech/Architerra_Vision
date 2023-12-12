import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Import Firebase Authentication
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArchiveImages extends StatefulWidget {
  const ArchiveImages({Key? key});

  @override
  State<ArchiveImages> createState() => _ArchiveImagesState();
}

class _ArchiveImagesState extends State<ArchiveImages> {
  int _counter = 0;
  late User? _user;  // User object to store the currently signed-in user

  @override
  void initState() {
    super.initState();
    _initializeFirebase();  // Initialize Firebase
    _checkCurrentUser();    // Check if a user is already signed in
  }

  // Initialize Firebase
  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // Check if a user is already signed in
  void _checkCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  void _addImages() async {
    if (_user == null) {
      // If no user is signed in, prompt the user to sign in
      // (You can replace this with your own authentication logic)
      print("User not signed in. Please sign in.");
      return;
    }

    var storage = FirebaseStorage.instance;

    List<String> listOfImage = [
      'images/Logo.png',
      'images/Logo.png',
      'images/Logo.png',
      'images/Logo.png',
      'images/Logo.png',
    ];

    // Loop through the list of images
    for (String img in listOfImage) {
      String imageName = 'Logo.png';
      String path = 'images/Logo.png';

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load("images/Logo.png");
      final file = File('${systemTempDir.path}.png');

      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      // Upload the image to Firebase Storage
      TaskSnapshot taskSnapshot =
          await storage.ref('${_user!.uid}/$path/$imageName').putFile(file);

      // Get the download URL of the uploaded image
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Save the image details in Firestore, associating it with the user ID
      await FirebaseFirestore.instance.collection(_user!.uid).add({
        "url": downloadUrl,
        "name": imageName,
      });

      _counter++;
      print(_counter);
      print("Uploading finished...");
    }

    print("All uploading finished...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your App Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are uploading the file to Firebase storage',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addImages,
        tooltip: 'Upload Images',
        child: const Icon(Icons.add),
      ),
    );
  }
}

