import 'package:flutter/material.dart';
import 'package:virtual_reality/constants.dart';
import 'dart:ui';
import 'package:virtual_reality/components/custom_outline.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Constants.kBlackColor,
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              right: 0,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  color: Constants.kPinkColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 166,
                      width: 166,
                    )),
              ),
            ),
            Positioned(
                top: screenHeight * 0.3,
                right: -100,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Constants.kGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                      child: Container(
                        height: 166,
                        width: 166,
                      )),
                )),
            Column(children: [
              SizedBox(
                height: screenHeight * 0.07,
              ),
              CustomOutline(
                strokeWidth: 4,
                radius: screenWidth * 0.8,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Constants.kPinkColor,
                    Constants.kPinkColor.withOpacity(0),
                    Constants.kGreenColor.withOpacity(0.1),
                    Constants.kGreenColor,
                  ],
                  stops: [0.2, 0.4, 0.6, 1],
                ),
                width: screenWidth * 0.8,
                height: screenHeight * 0.8,
                padding: EdgeInsets.all(4),
                child: Container(
                  decoration: BoxDecoration(
                     
                  )
                ),
              ),
            ])
          ]),
        ));
  }
}
