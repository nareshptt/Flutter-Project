import 'package:agronet/Pages/profile.dart';
import 'package:flutter/material.dart';

import 'activity.dart';
import 'home.dart';

class BottumNavigation extends StatefulWidget {
  const BottumNavigation({super.key});

  @override
  State<BottumNavigation> createState() => _BottumNavigationState();
}

class _BottumNavigationState extends State<BottumNavigation> {
  int currentIndex = 0;

  late List<Widget> pages;
  late HomePage homepage;
  late Widget currentPage;
  late Profile profile;
  late Activity activity;

  @override
  void initState() {
    homepage = HomePage();
    activity = Activity();
    profile = Profile();

    pages = [homepage, activity, profile];
    currentPage = homepage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: currentIndex, // Highlight the selected tab
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = pages[index];
            }); // Handle tab selection
          }),
    );
  }
}
