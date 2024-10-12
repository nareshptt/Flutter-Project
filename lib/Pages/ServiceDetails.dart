import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottomNavigation.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ActivityState();
}

class _ActivityState extends State<ServiceDetail> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Status bar color
        systemNavigationBarColor: Colors.white, // Navigation bar color
        statusBarIconBrightness: Brightness.dark, // Dark icons on status bar
        systemNavigationBarIconBrightness:
            Brightness.dark, // Dark icons on navigation bar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // White background
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottumNavigation()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 27,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Consultation",
                    style: TextStyle(
                      fontSize: 20, // Slightly increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Number of activity items
                  itemBuilder: (context, index) {
                    return _buildActivityCard(
                      profileImageUrl:
                          'https://via.placeholder.com/100', // Dummy image URL
                      name: 'Naresh Kumar', // Sample name
                      serviceName: 'Plumbing Service', // Sample service name
                      onCallPressed: () {
                        // Handle call button action here
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
    required VoidCallback onCallPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8), // Reduced vertical margin
      padding: EdgeInsets.all(10), // Reduced padding inside container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(12), // Slightly smaller border radius
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.15), // Lighter shadow for compact look
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // Softer shadow
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image with Circular Border
          Container(
            width: 50, // Reduced profile image size
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF1976D2), // Dark blue border
                width: 2,
              ),
              image: DecorationImage(
                image: NetworkImage(profileImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12), // Reduced space between image and text

          // Name, Service, and Call Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16, // Slightly smaller font for name
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "Poppins",
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                    height: 2), // Reduced space between name and service name
                Text(
                  serviceName, // Display service name
                  style: TextStyle(
                    fontSize: 14, // Smaller font size for service name
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 6), // Reduced space before call action
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color(0xFF1976D2),
                      size: 16, // Smaller icon size
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Tap to Call",
                      style: TextStyle(
                        fontSize: 13, // Smaller font for call text
                        color: Color(0xFF1976D2),
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
              shape: CircleBorder(), backgroundColor: Color(0xFF1976D2),
              padding: EdgeInsets.all(12), // Dark blue background
            ),
            child: Icon(
              Icons.phone,
              color: Colors.white,
              size: 22, // Slightly smaller call icon
            ),
          ),
        ],
      ),
    );
  }
}
