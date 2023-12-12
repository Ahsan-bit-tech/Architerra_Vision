import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/contactus/components/body.dart';
// import 'package:rive/rive.dart';
// import 'package:rive/rive.dart';
//import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/welcome/welcome_screen.dart';
//import 'package:flutter_login/screens/helpus/background.dart';
//import 'package:flutter_login/screens/contactus/components/body.dart';
// import 'package:flutter_login/screens/about us/background.dart';
import 'package:flutter_login/screens/about us/components/body.dart';
import 'package:flutter_login/screens/UserProfile/body.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool isActive = false;
  String activeItem = "";
  Map<String, bool> isActiveMap = {
    "Home": false,
    "AnotherItem": false,
    // Add other menu items here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0XFF006064),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Ahsan",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "User",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Browser".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            const Divider(
              color: Colors.white24,
              height: 1,
            ),
            buildMenuItem("Home", "images/home.png", WelcomeScreen()),
            buildMenuItem(
                "User Details", "images/userdetails.png", User_profile()),
            buildMenuItem("Archive", "images/archive.png", WelcomeScreen()),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.white24,
              height: 1,
            ),
            buildMenuItem(
                "About Us", "images/aboutUs.png", const aboutUsPage()),
            buildMenuItem(
                "Contanct Us", "images/feedback.png", const ContactForm(),
                url:
                    "https://docs.google.com/forms/d/e/1FAIpQLSdIsrbelJrX6up_RSvkkuL_7WkISArcXNieVwkdudqjD3FI4Q/viewform?usp=sf_link"),

            // buildMenuItem("AnotherItem", "images/Logo.png"),
            // buildMenuItem("Help", "images/Logo.png")
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String title, String imagePath, Widget destination,
      {String? url}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
        ),
        GestureDetector(
          onTap: () {
            // Update the active state for the pressed menu item
            setState(() {
              activeItem = title;
              print('Contact Us button tapped');
            });
            if (url != null) {
              _launchurl();
            } else {
              Future.delayed(Duration(milliseconds: 550), () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => destination));
              });
            }
          },
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: Colors.transparent,
              end: activeItem == title
                  ? Color.fromARGB(255, 53, 156, 160)
                  : Colors.transparent,
            ),
            duration:
                Duration(milliseconds: 150), // Adjust the duration as needed
            builder: (_, Color? color, __) {
              return Container(
                height: 56,
                width: 288,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  leading: SizedBox(
                    height: 26, // adjust the height as needed
                    width: 26, // adjust the width as needed
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain, // or BoxFit.cover, BoxFit.fill, etc.
                    ),
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                      color:
                          activeItem == title ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

/*
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      Uri uri = Uri.parse(url);
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
*/

  _launchurl() async {
    const url =
        "https://docs.google.com/forms/d/e/1FAIpQLSdIsrbelJrX6up_RSvkkuL_7WkISArcXNieVwkdudqjD3FI4Q/viewform?usp=sf_link";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch the url";
    }
  }
}
