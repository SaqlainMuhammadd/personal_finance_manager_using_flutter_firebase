import 'package:flutter/material.dart';
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
                subtitle: 'Your Personal Finance Manager',
                engagingText: 'Manage your finances effortlessly with PFM.',
              ),
              buildOnboardingPage(
                context,
                image: 'assets/image2.png',
                title: 'Track Your Expenses',
                subtitle: 'Manage your expenses effectively',
                engagingText: 'Keep track of every penny you spend.',
              ),
              buildOnboardingPage(
                context,
                image: 'assets/image3.png',
                title: 'Save More',
                subtitle: 'Achieve your financial goals',
                engagingText: 'Set your savings goals and achieve them.',
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigate to the main app
              },
              child: Text(
                'Skip',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
      required String subtitle,
      required String engagingText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    engagingText,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonWidget(
                      text: _currentPage == 2 ? 'Get Started' : 'Next',
                      onPressed: () {
                        if (_currentPage == 2) {
                          // Navigate to the main app
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
        ),
      ],
    );
  }
}
