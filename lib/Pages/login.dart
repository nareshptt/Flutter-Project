import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to white
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Title
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 40, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  // Subtitle Text
                  Text(
                    "Please sign in to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: "Poppins",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

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
                      height: 55,
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
                              size: 28, color: Colors.white),
                          SizedBox(width: 12),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

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
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),

                  // Optional Footer (Privacy/Terms)
                  SizedBox(height: 20),
                  Text(
                    "By signing in, you agree to our Terms & Conditions.",
                    style: TextStyle(
                      fontSize: 12,
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
    );
  }
}
