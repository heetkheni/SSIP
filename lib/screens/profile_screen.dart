import 'package:arogya_mitra/screens/chat_screen.dart';
import 'package:arogya_mitra/screens/home_screen.dart';
import 'package:arogya_mitra/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;
  List<Widget> screens = [
    HomeScreen(),
    HealthCenterMap(),
    ChatScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screens[i]));
        },
        selectedItemColor: Color(0xFF0856DE),
        itemPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
            ),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.local_hospital,
            ),
            title: const Text("Hospital"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.message),
            title: const Text("Chat"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}