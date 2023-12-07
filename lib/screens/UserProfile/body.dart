import 'package:flutter/material.dart';

void main() {
  runApp(User_profile());
}

class User {
  String name;
  String contact;
  String email;

  User({required this.name, required this.contact, required this.email});
}

class User_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Simulating a user being logged in
  User currentUser =
      User(name: "Ahsan", contact: "1234567890", email: "abc@example.com");

  @override
  void initState() {
    super.initState();

    // Set initial values for text controllers based on the logged-in user's information
    nameController.text = currentUser.name;
    contactController.text = currentUser.contact;
    emailController.text = currentUser.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Container(
        color: Colors.white, // Set the background color of the page to white
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar and heading
              Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    // You can replace the backgroundImage with the actual image URL or asset path
                    backgroundImage: AssetImage(
                        'images/img_5.png'), // Example: 'assets/user_avatar.png'
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentUser.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      32), // Adjust the space between the avatar and text fields

              // Textboxes centered on the page
              Center(
                child: Column(
                  children: [
                    _buildTextField("Contact", contactController),
                    SizedBox(height: 16),
                    _buildTextField("Email", emailController),
                    SizedBox(height: 16),
                  ],
                ),
              ),

              SizedBox(
                  height:
                      32), // Adjust the space between the textboxes and the image
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: ElevatedButton(
          onPressed: () {
            // Show a logout confirmation popup
            _showLogoutConfirmation();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // Set the color of the button
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16.0), // Adjust the vertical padding as needed
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    width:
                        20.0), // Adjust the space between the text and the icon as needed
                Icon(Icons.logout, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Position the logout button at the bottom right corner
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        SizedBox(
          width: 400, // Set the width as per your requirement
          child: TextField(
            controller: controller,
            enabled: false,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              fillColor: Color(0xFFE0F2F1),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to show the logout confirmation popup
  Future<void> _showLogoutConfirmation() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add your logout logic here
                // For now, let's just navigate to the login page
                Navigator.pop(context); // Close the user profile page

                // Show "Logged Out" message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged Out'),
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
