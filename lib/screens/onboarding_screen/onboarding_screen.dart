import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/screens/main_screen/input_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => onboardcontent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].descrition,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: onDotContainer(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  _pageIndex == demo_data.length - 1
                      ? ElevatedButton(
                          onPressed: () {
                            // Handle the Sign Up button press
                            // For example, navigate to the Sign Up screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Input_Screen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadowColor: kPrimaryColor,
                            backgroundColor: kPrimaryColor,
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              shadowColor: kPrimaryColor,
                              backgroundColor: kPrimaryColor,
                            ),
                            child: Transform.scale(
                              scale: 1.6,
                              child: Image.asset(
                                "images/arrow.png",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class onDotContainer extends StatelessWidget {
  const onDotContainer({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : kPrimaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class onboard {
  final String image, title, descrition;

  onboard({required this.image, required this.title, required this.descrition});
}

late Future<void> _animationDelay;
final List<onboard> demo_data = [
  onboard(
      image: "animation/measurement.json",
      title: "Give Measurements",
      descrition:
          "Empower your design journey with Architerra Vision as you input your measurements to shape a personalized blueprint for your dream home. Seamlessly craft unique architectural plans, turning your vision into reality. Design with precision using Architerra Vision."),
  onboard(
      image: "animation/artificial_int.json",
      title: "AI-Powered",
      descrition:
          "Design your dream home effortlessly with Architerra Vision, powered by AI for intelligent and personalized architectural blueprints. Unlock seamless creativity and transform visions into reality."),
  onboard(
      image: "animation/input.json",
      title: "Visualize Designs",
      descrition:
          "Create and visualize your dream home with this app, the ultimate blueprint design app that empowers users to bring their architectural visions to life. Whether you're planning a new construction, renovation, or just exploring design possibilities, Architerra Vision provides an intuitive platform for crafting and customizing detailed house plans."),
];

class onboardcontent extends StatelessWidget {
  const onboardcontent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Lottie.asset(image, height: 300, repeat: false),
      // Image.asset(
      //   image,
      //   height: 250,
      // ),
      const Spacer(),
      Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      const SizedBox(
        height: 16,
      ),
      Text(
        description,
        textAlign: TextAlign.center,
      ),
      const Spacer(),
    ]);
  }
}
