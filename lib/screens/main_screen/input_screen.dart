import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/main_screen/components/textbox.dart';
import 'package:flutter_login/screens/BluePrints/components/sidebar.dart';

class Input_Screen extends StatefulWidget {
  const Input_Screen({super.key});

  @override
  State<Input_Screen> createState() => _Input_ScreenState();
}

class _Input_ScreenState extends State<Input_Screen>
    with SingleTickerProviderStateMixin {
  bool isActive = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleanimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 380),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleanimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0XFF006064),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
              duration: Duration(milliseconds: 160),
              curve: Curves.fastOutSlowIn,
              width: 288,
              height: MediaQuery.of(context).size.height,
              child: SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleanimation.value,
                child: const ClipRRect(
                  child: Body(),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isActive ? 0 : 220,
            top: 16,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isActive = !isActive;
                  if (!isActive) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 3),
                        blurRadius: 8)
                  ],
                ),
                child: isActive
                    ? Image.asset(
                        "images/bars.png",
                        height: 27,
                        width: 27,
                      )
                    : Image.asset(
                        "images/close.png",
                        height: 22,
                        width: 22,
                      ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
