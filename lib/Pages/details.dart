import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  All',
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
      body: _buildDetails(),
    );
  }

  Container _buildDetails() {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.12, // Adjust height based on screen size
      margin: EdgeInsets.only(
        top: 12,
        left: screenSize.width * 0.05, // 5% left margin
        right: screenSize.width * 0.05, // 5% right margin
      ),
      padding: EdgeInsets.all(screenSize.width * 0.04), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: screenSize.width * 0.15, // 15% of screen width
              height: screenSize.width * 0.15, // Keep it square
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenSize.width * 0.15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://via.placeholder.com/100'),
                ),
              ),
            ),
            SizedBox(width: screenSize.width * 0.04), // Spacing
            Text(
              "Naresh Kumar",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenSize.width * 0.045, // Responsive font size
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
