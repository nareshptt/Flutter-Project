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
    // Set status bar color every time the widget is rebuilt
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Status bar color
        systemNavigationBarColor: Colors.white, // Navigation bar color
        statusBarIconBrightness: Brightness.dark, // Dark icons on status bar
        systemNavigationBarIconBrightness: Brightness.dark, // Dark nav icons
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCustomAppBar(), // Custom App Bar instead of default AppBar
            const SizedBox(height: 20),

            // Profile Picture with Gradient Border and Pencil Icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF1976D2), Color(0xFFBBDEFB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(3), // For border thickness
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF1976D2),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Color(0xFF1976D2),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Profile Information with Gradient Highlight
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBBDEFB), Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: const [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Contrast with gradient background
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    '123-456-7890',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Services Section with Header and Add Service Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Services",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8), // Padding inside button
                    ),
                    icon: const Icon(
                      Icons.add,
                      size: 18, // Smaller icon
                      color: Color(0xFF1976D2), // Icon color
                    ),
                    label: const Text(
                      "Add Service",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1976D2), // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Services List in Horizontal Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildServiceCard('Market Prices', 'images/jcb.png',
                        'Get the latest market prices.'),
                    const SizedBox(width: 15),
                    _buildServiceCard('Consultation', 'images/addimage.png',
                        'Expert consultation available.'),
                    const SizedBox(width: 15),
                    _buildServiceCard('Market Prices', 'images/jcb.png',
                        'Get the latest market prices.'),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom AppBar Replacement
  Widget _buildCustomAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
              fontSize: 26,
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
  Widget _buildServiceCard(String title, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        // Add interaction logic here
      },
      child: Container(
        width: 180, // Adjusted width for better proportions
        margin: const EdgeInsets.only(
            right: 5, top: 10, bottom: 5), // Added margin for spacing
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
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                height: 100, // Updated height
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16, // Slightly smaller font
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12, // Slightly smaller font
                      color: Colors.black54,
                    ),
                    maxLines: 2, // Truncate long text
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
