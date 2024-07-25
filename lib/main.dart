import 'package:animation_drawer/drawer_screen.dart';
import 'package:animation_drawer/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home: Scaffold(
      body: Stack(
        children: [
          const DrawerScreen(),
          HomeScreen(),
        ],
      ),
     ),

  
    );
  }
}
