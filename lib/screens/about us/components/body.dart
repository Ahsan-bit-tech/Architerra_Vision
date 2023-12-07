import 'package:flutter/material.dart';

class aboutUsPage extends StatelessWidget {
  const aboutUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF00838F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            SizedBox(height: 16),
            _buildDescription(),
            SizedBox(height: 24),
            _buildMissionVision(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo1.png',
            height: 140, // Adjust the height of the image
            width: 140, // Adjust the width of the image
          ),
          SizedBox(height: 16),
          Text(
            'Welcome to Architerra Visions!',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'At Architerra Visions, we are passionate about simplifying the architectural design process for you. Our mission is to provide a seamless and convenient experience for individuals and professionals alike.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Explore the ease of getting your dream designs by simply entering the required details. We are committed to making your architectural visions come to life!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionVision() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Our Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'To revolutionize the architectural industry by providing innovative and user-friendly design solutions.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Our Vision',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'To be the go-to platform for individuals and professionals seeking hassle-free architectural designs.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
