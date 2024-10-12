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
    final screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05; // 5% padding

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(screenSize, padding),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: padding),
                children: [
                  _buildTitleText("Explore Services"),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.', screenSize),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.', screenSize),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.', screenSize),
                  const SizedBox(height: 20),
                  _buildServiceCard('Consultation', 'images/addimage.png',
                      'Expert consultation available.', screenSize),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(Size screenSize, double padding) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 15),
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
            width: screenSize.width * 0.85, // 85% of screen width
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

  Widget _buildServiceCard(
      String title, String imagePath, String description, Size screenSize) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ServiceDetail()));
      },
      child: Container(
        height: screenSize.height * 0.18, // 18% of screen height
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
                height: screenSize.height * 0.18,
                width: screenSize.width * 0.35, // 35% of screen width
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(
                    screenSize.width * 0.04), // Responsive padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF424242),
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
