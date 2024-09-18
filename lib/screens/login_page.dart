import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:virtual_reality/components/custom_outline.dart';
import 'package:virtual_reality/constants.dart';
import 'package:virtual_reality/screens/home_page.dart';
import 'package:virtual_reality/screens/onboarding_screen.dart';
import 'package:virtual_reality/screens/signup_page.dart'; // Import login page

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
  // State variable to track password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: Stack(
        children: [
          // Background Circles
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
                child: const SizedBox(
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          // Backward Icon
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Constants.kWhiteColor),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingScreen(),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Gradient Bordered Form Container
                    CustomOutline(
                      strokeWidth: 2,
                      radius: 20,
                      padding: const EdgeInsets.all(0),
                      gradient: const LinearGradient(
                        colors: [
                          Constants.kPinkColor,
                          Constants.kGreenColor,
                        ],
                      ),
                      width: screenWidth * 0.90,
                      height: screenHeight * 0.65, // Increased height a bit
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Constants.kBlackColor.withOpacity(0.7),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            _buildTextField(
                              hintText: "Email",
                              icon: Icons.email_outlined,
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              hintText: "Password",
                              icon: _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              obscureText: !_isPasswordVisible,
                              onIconPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                //login-up logic here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: CustomOutline(
                                strokeWidth: 0,
                                radius: 0,
                                gradient: const LinearGradient(
                                  colors: [
                                    Constants.kPinkColor,
                                    Constants.kGreenColor,
                                  ],
                                ),
                                width: 170,
                                height: 80,
                                padding: const EdgeInsets.all(16),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 32),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        Constants.kPinkColor.withOpacity(0.5),
                                        Constants.kGreenColor.withOpacity(0.5),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Constants.kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Constants.kWhiteColor.withOpacity(0.6),
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Constants.kPinkColor,
                                    Constants.kGreenColor,
                                  ],
                                ).createShader(bounds),
                                child: const Text(
                                  'Signup',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Input Field with Icon, Toggle for Password Visibility
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    VoidCallback? onIconPressed,
  }) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Constants.kWhiteColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: Constants.kWhiteColor.withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Constants.kWhiteColor.withOpacity(0.6),
        ),
        suffixIcon: GestureDetector(
          onTap: onIconPressed,
          child: Icon(
            icon,
            color: Constants.kWhiteColor.withOpacity(0.6),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
