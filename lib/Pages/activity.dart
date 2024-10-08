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
              Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 20, // Slightly increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: "Poppins",
                ),
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

  // Custom Activity Card with profile picture, name, and call button
  Widget _buildActivityCard({
    required String profileImageUrl,
    required String name,
    required VoidCallback onCallPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image with Circular Border
          Container(
            width: 60,
            height: 60,
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
          SizedBox(width: 15),

          // Name and Call Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "Poppins",
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color(0xFF1976D2),
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Tap to Call",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Call Button with Icon
          IconButton(
            icon: Icon(Icons.phone, color: Colors.white),
            onPressed: onCallPressed,
            color: Color(0xFF1976D2), // App theme color for the call button
            iconSize: 28,
            padding: EdgeInsets.all(12),
            splashRadius: 25,
            constraints: BoxConstraints(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1976D2),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
