import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'ServiceDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLocation = 'Select location';
  final List<String> locations = [
    "Tokyo",
    "New York",
    "Paris",
    "London",
    "Beijing",
    "Sydney",
    "Bangkok",
    "Dubai",
    "Shanghai",
    "Moscow"
  ];
  final videoURL = 'https://www.youtube.com/watch?v=XO8wew38VM8';
  late YoutubePlayerController playerController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(videoURL);
    playerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section with location input and a search bar
            _buildHeroSection(),
            const SizedBox(height: 20),
            // Custom Promotion Container

            // Dynamic Promotions section with carousel
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildTitleText("Explore Services"),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.'),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.'),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.'),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on,
                      color: Colors.blueAccent, size: 25),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Show the dropdown menu
                      _showLocationDropdown();
                    },
                    child: Text(
                      selectedLocation,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Show the dropdown menu
                  _showLocationDropdown();
                },
                child:
                    const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Where to?",
                hintStyle: const TextStyle(color: Colors.black54),
                icon: const Icon(Icons.search, color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Location"),
          content: SizedBox(
            width: 300,
            height: 200,
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(locations[index]),
                  onTap: () {
                    setState(() {
                      selectedLocation = locations[index];
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF424242), // Dark grey for titles
      ),
    );
  }

  Widget _buildServiceCard(String title, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ServiceDetail()));
      },
      child: Container(
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121), // Black text
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF424242), // Dark grey text
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
