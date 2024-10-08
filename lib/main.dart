import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Pages/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Status bar color
      systemNavigationBarColor: Colors.white, // Navigation bar color
      statusBarIconBrightness: Brightness.dark, // Light icons on status bar
      systemNavigationBarIconBrightness:
          Brightness.light, // Light icons on navigation bar
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: BottumNavigation(),
    );
  }
}
