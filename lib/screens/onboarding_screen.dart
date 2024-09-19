import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:virtual_reality/components/custom_outline.dart';
import 'package:virtual_reality/constants.dart';
import 'package:virtual_reality/screens/home_page.dart';
import 'package:virtual_reality/screens/signup_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            _buildBlurCircles(screenHeight),
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildOnboardingContent(
                  screenHeight,
                  screenWidth,
                  'assets/img-onboarding.png',
                  'Watch movies in \n Virtual Reality',
                  'Download and watch offline\n wherever you are ',
                ),
                _buildOnboardingContent(
                  screenHeight,
                  screenWidth,
                  'assets/img-onboarding2.jpeg',
                  'Explore a new reality',
                  'Immerse yourself in the latest technology',
                ),
                _buildOnboardingContent(
                  screenHeight,
                  screenWidth,
                  'assets/img-onboarding3.jpeg',
                  'Feel the experience',
                  'Experience entertainment like never before',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to create the blur circles in the background
  Widget _buildBlurCircles(double screenHeight) {
    return Stack(
      children: [
        Positioned(
          top: screenHeight * 0.1,
          left: -88,
          child: Container(
            height: 166,
            width: 166,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.kPinkColor,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
              child: const SizedBox(
                height: 166,
                width: 166,
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.3,
          right: -100,
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.kGreenColor,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
              child: Container(
                height: 200,
                width: 200,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to create the onboarding content with the same design
  Widget _buildOnboardingContent(
    double screenHeight,
    double screenWidth,
    String imagePath,
    String title,
    String subtitle,
  ) {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.07),
            CustomOutline(
              strokeWidth: 4,
              radius: screenWidth * 0.8,
              padding: const EdgeInsets.all(4),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kPinkColor.withOpacity(0),
                  Constants.kGreenColor.withOpacity(0.1),
                  Constants.kGreenColor,
                ],
                stops: const [0.2, 0.4, 0.6, 1],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              ),
              width: screenWidth * 0.8,
              height: screenWidth * 0.8,
            ),
            SizedBox(height: screenHeight * 0.09),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenHeight <= 660 ? 18 : 34,
                fontWeight: FontWeight.w700,
                color: Constants.kWhiteColor.withOpacity(0.8),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenHeight <= 660 ? 12 : 16,
                fontWeight: FontWeight.w100,
                color: Constants.kWhiteColor.withOpacity(0.75),
              ),
            ),
            SizedBox(
                height: screenHeight * 0.05), // Increased space before dots
            _buildDotsIndicator(),
            SizedBox(
                height: screenHeight * 0.02), // Space between dots and button
            if (screenHeight <= 660 || _currentPage == 2)
              _buildSignUpButton(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  // Function to build dots indicator for the current onboarding page
  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            height: 7,
            width: 7,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index
                  ? Constants.kGreenColor
                  : Constants.kWhiteColor.withOpacity(0.2),
            ),
          ),
        );
      }),
    );
  }

  // Function to build the sign-up button
  Widget _buildSignUpButton(double screenHeight, double screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      child: CustomOutline(
        strokeWidth: 3,
        radius: 20,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Constants.kPinkColor, Constants.kGreenColor],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.5),
                Constants.kGreenColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenHeight <= 660 ? 11 : 15,
                fontWeight: FontWeight.w700,
                color: Constants.kWhiteColor,
              ),
            ),
          ),
        ),
        width: 160,
        height: 38,
        padding: const EdgeInsets.all(3),
      ),
    );
  }
}
