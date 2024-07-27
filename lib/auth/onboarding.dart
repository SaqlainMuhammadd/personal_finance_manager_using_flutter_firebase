import 'package:flutter/material.dart';
import 'package:personal_finance_manager_using_flutter_firebase/auth/signup.dart';
import 'package:personal_finance_manager_using_flutter_firebase/widgets/custombutton.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              buildOnboardingPage(
                context,
                image: 'assets/image1.png',
                title: 'Welcome to PFM',
                engagingText:
                    'Take control of your financial future with PFM! Our app helps you manage, track, and grow your finances effortlessly.',
              ),
              buildOnboardingPage(
                context,
                image: 'assets/image2.png',
                title: 'Track Your Expenses',
                engagingText:
                    'Keep track of every penny you spend with our detailed expense tracking feature. Know where your money goes and make smarter financial decisions.',
              ),
              buildOnboardingPage(
                context,
                image: 'assets/image3.png',
                title: 'Save More',
                engagingText:
                    'Turn your financial dreams into reality. Set your savings goals and watch as our app helps you achieve them step by step.',
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ));
              },
              child: Text(
                'Skip',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(BuildContext context,
      {required String image,
      required String title,
      required String engagingText}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Adding space between skip button and image
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0), // Space around the image
            child: Image.asset(
              image,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 32), // Space between the image and card container
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 8,
            color: Colors.blue.shade800,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    engagingText,
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonWidget(
                      text: _currentPage == 2 ? 'Get Started' : 'Next',
                      onPressed: () {
                        if (_currentPage == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ));
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
