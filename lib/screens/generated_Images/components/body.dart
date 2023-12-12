import 'dart:io';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageGenerator extends StatelessWidget {
  const ImageGenerator({
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageScreen(),
    );
  }
}

class MyImageScreen extends StatefulWidget {
  @override
  _MyImageScreenState createState() => _MyImageScreenState();
}

class _MyImageScreenState extends State<MyImageScreen> {
  List<String> savedImages = [];
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'AI Generated Images',
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        // backgroundColor: Color(0xFF00838F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 3, // Assuming you have 3 images
          itemBuilder: (BuildContext context, int index) {
            return _buildImageCard('BluePrint ${index + 1}',
                'images/img${index + 1}.png', context, index);
          },
        ),
      ),
    );
  }

  Widget _buildImageCard(
      String title, String imagePath, BuildContext context, int index) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _viewImage(imagePath);
            },
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // ----------------------------

                  // _addImages();

                  // __________________________________

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Image Saved: $title'),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return Color(0xFF00838F); // Hovered or pressed state
                      }
                      return Color(0xFFE0F2F1); // Default state
                    },
                  ),
                ),
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  _viewImage(imagePath);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return Color(0xFF00838F); // Hovered or pressed state
                      }
                      return Color(0xFFE0F2F1); // Default state
                    },
                  ),
                ),
                child: const Text('View'),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _addImages() {
    var storage = FirebaseStorage.instance;

    List<String> listOfImage = [
      'images/Logo.png',
      'images/Logo.png',
      'images/Logo.png',
      'images/Logo.png',
      'images/Logo.png',
    ];

    listOfImage.forEach((img) async {
      String imageName = 'Logo.png';
      //     img.substring(img.lastIndexOf("/"), img.lastIndexOf("."));

      String path = 'images/Logo.png';

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load("images/Logo.png");
      final file = File('${systemTempDir.path}.png');

      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      TaskSnapshot taskSnapshot =
          await storage.ref('$path/$imageName').putFile(file);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection(path)
          .add({"url": downloadUrl, "name": imageName});

      print("Uploading finished.....2");
    });
    print("Uploading finished.....");
  }

  void _viewImage(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 300,
            child: PhotoView(
              imageProvider: AssetImage(imagePath),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
