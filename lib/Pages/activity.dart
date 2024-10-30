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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: screenHeight * 0.03, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: screenHeight * 0.03,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

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
                      screenWidth: screenWidth, // Pass screenWidth
                      screenHeight: screenHeight, // Pass screenHeight
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
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:
            BorderRadius.circular(screenHeight * 0.02), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image with Circular Border
          Container(
            width: screenHeight * 0.08,
            height: screenHeight * 0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF1976D2), width: 2),
              image: DecorationImage(
                image: NetworkImage(profileImageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.04),

          // Name, Service, and Action Buttons
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
                SizedBox(height: screenHeight * 0.005),
                Text(
                  serviceName,
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
          // Call Button
          IconButton(
            onPressed: onCallPressed,
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            color: const Color(0xFF1976D2),
            iconSize: screenHeight * 0.04,
          ),
        ],
      ),
    );
  }
}
