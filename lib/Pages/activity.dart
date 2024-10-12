import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  void initState() {
    super.initState();
    // Set status and navigation bar color and icon brightness
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.015,
          ), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: screenHeight * 0.028, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              // Expanded ListView for activity cards
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Number of activity items
                  itemBuilder: (context, index) {
                    return _buildActivityCard(
                      profileImageUrl:
                          'https://via.placeholder.com/100', // Dummy image URL
                      name: 'Naresh Kumar', // Sample name
                      serviceName: 'Plumbing Service', // Sample service name
                      screenWidth:
                          screenWidth, // Pass screenWidth for responsive layout
                      screenHeight:
                          screenHeight, // Pass screenHeight for responsive layout
                      onCallPressed: () {
                        // Handle call button action
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Activity Card with profile picture, name, service, and call button
  Widget _buildActivityCard({
    required String profileImageUrl,
    required String name,
    required String serviceName,
    required double screenWidth, // Screen width for responsiveness
    required double screenHeight, // Screen height for responsiveness
    required VoidCallback onCallPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01, // Responsive vertical margin
      ),
      padding: EdgeInsets.all(screenHeight * 0.015), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            screenHeight * 0.015), // Responsive border radius
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2), // Slight shadow effect
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image with Circular Border
          Container(
            width: screenHeight * 0.07, // Responsive profile image size
            height: screenHeight * 0.07,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF1976D2),
                width: 2,
              ),
              image: DecorationImage(
                image: NetworkImage(profileImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
              width: screenWidth *
                  0.04), // Responsive space between image and text

          // Name, Service, and Call Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "Poppins",
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                    height: screenHeight *
                        0.005), // Responsive space between name and service name
                Text(
                  serviceName, // Display service name
                  style: TextStyle(
                    fontSize: screenHeight * 0.018, // Responsive font size
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                    height: screenHeight *
                        0.008), // Responsive space before call action
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: const Color(0xFF1976D2),
                      size: screenHeight * 0.02, // Responsive icon size
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "Tap to Call",
                      style: TextStyle(
                        fontSize: screenHeight * 0.018, // Responsive font size
                        color: const Color(0xFF1976D2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Call Button with Icon
          ElevatedButton(
            onPressed: onCallPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF1976D2),
              padding:
                  EdgeInsets.all(screenHeight * 0.015), // Responsive padding
            ),
            child: Icon(
              Icons.phone,
              color: Colors.white,
              size: screenHeight * 0.025, // Responsive call icon size
            ),
          ),
        ],
      ),
    );
  }
}
