import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
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
                onPressed: () {
                  // Add the image path to the savedImages list
                  setState(() {
                    savedImages.add(imagePath);
                  });

                  // Add your save functionality here if needed

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
