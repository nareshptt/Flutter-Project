import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import 'bottomNavigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive layout
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to white
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06), // Responsive padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // App Title with Lottie animation
                    Container(
                      width: screenWidth * 0.9, // Responsive width
                      height: screenHeight *
                          0.35, // Responsive height for the animation
                      child: Lottie.asset(
                        'images/Animations/login.json',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Responsive spacing

                    // Subtitle Text
                    Text(
                      "Please sign in to continue",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02, // Responsive font size
                        color: Colors.black54,
                        fontFamily: "Poppins",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.04), // Responsive spacing

                    // Google Sign-in Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottumNavigation()),
                        );
                      },
                      child: Container(
                        height: screenHeight * 0.07, // Responsive height
                        decoration: BoxDecoration(
                          color: Colors.blueAccent, // Button color
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.google,
                                size: screenHeight *
                                    0.035, // Responsive icon size
                                color: Colors.white),
                            SizedBox(
                                width:
                                    screenWidth * 0.03), // Responsive spacing
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                fontSize:
                                    screenHeight * 0.02, // Responsive font size
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing

                    // Terms and Conditions Checkbox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!; // Update the checkbox state
                            });
                          },
                          activeColor:
                              Colors.blueAccent, // Checkbox color when selected
                          checkColor: Colors.white, // Check color when selected
                        ),
                        Expanded(
                          child: Text(
                            "I agree to the Terms & Conditions.",
                            style: TextStyle(
                              fontSize:
                                  screenHeight * 0.015, // Responsive font size
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),

                    // Optional Footer (Privacy/Terms)
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing
                    Text(
                      "By signing in, you agree to our Terms & Conditions.",
                      style: TextStyle(
                        fontSize: screenHeight * 0.015, // Responsive font size
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
