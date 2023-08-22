import 'package:flutter/material.dart';
import 'package:travelapp/nav_screens/camera_page.dart';
import 'package:travelapp/nav_screens/home_page.dart';
import 'package:travelapp/nav_screens/map_page.dart';
import 'package:travelapp/nav_screens/user_profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [HomePage(), CameraPage(), UserProfilePage(), MapPage()];

  int curIndex = 0;

  void onTap(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[curIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: curIndex,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.greenAccent.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 1,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'AR camera'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        ],
      ),
    );
  }
}
