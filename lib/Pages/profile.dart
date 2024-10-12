import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // Ensure status bar color and icon brightness are set when the widget initializes
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
    // Use MediaQuery to make the layout responsive
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCustomAppBar(
                  screenWidth), // Custom App Bar instead of default AppBar

              // Profile Picture with Gradient Border and Pencil Icon
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.03),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF1976D2), Color(0xFFBBDEFB)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(
                        screenHeight * 0.005), // For border thickness
                    child: CircleAvatar(
                      radius: screenHeight *
                          0.08, // Responsive profile picture radius
                      backgroundImage: const NetworkImage(
                          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle the pencil icon tap (e.g., change profile picture)
                      },
                      child: Container(
                        width: screenHeight * 0.05,
                        height: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF1976D2),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: const Color(0xFF1976D2),
                          size: screenHeight * 0.025, // Responsive icon size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

              // Profile Information with Gradient Highlight
              Container(
                width: screenWidth * 0.85, // Responsive width
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.05,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFBBDEFB), Color(0xFF1976D2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: screenHeight * 0.03, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '123-456-7890',
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Services Section with Header and Add Service Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Services",
                      style: TextStyle(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0D47A1),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle add service functionality
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF1976D2),
                        backgroundColor: Colors.white, // Button color
                        side: const BorderSide(
                            color: Color(0xFF1976D2), width: 1), // Border color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.01,
                        ), // Padding inside button
                      ),
                      icon: Icon(
                        Icons.add,
                        size: screenHeight * 0.02, // Responsive icon size
                        color: const Color(0xFF1976D2),
                      ),
                      label: Text(
                        "Add Service",
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1976D2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Services List in Horizontal Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildServiceCard(
                        'Market Prices',
                        'images/jcb.png',
                        'Get the latest market prices.',
                        screenWidth,
                        screenHeight,
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      _buildServiceCard(
                        'Consultation',
                        'images/addimage.png',
                        'Expert consultation available.',
                        screenWidth,
                        screenHeight,
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      _buildServiceCard(
                        'Market Prices',
                        'images/jcb.png',
                        'Get the latest market prices.',
                        screenWidth,
                        screenHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom AppBar Replacement
  Widget _buildCustomAppBar(double screenWidth) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: screenWidth * 0.04,
        right: screenWidth * 0.04,
      ),
      decoration: const BoxDecoration(
        color: Colors.white, // Background color of custom app bar
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              color: Color(0xFF1976D2), // Dark blue for the title
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF1976D2), size: 28),
            onPressed: () {
              // Handle logout functionality here
            },
          ),
        ],
      ),
    );
  }

  // Enhanced Service Card with Badge, Image, Title, Description, and Edit Icon
  Widget _buildServiceCard(String title, String imagePath, String description,
      double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        // Add interaction logic here
      },
      child: Container(
        width: screenWidth * 0.45, // Responsive width
        margin: EdgeInsets.only(
          right: screenWidth * 0.02,
          top: screenHeight * 0.015,
          bottom: screenHeight * 0.015,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: screenHeight * 0.15, // Responsive image height
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      // Handle edit icon tap
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.01,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1976D2),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: screenHeight * 0.015,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
          ],
        ),
      ),
    );
  }
}
