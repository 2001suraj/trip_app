// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_tourist_guide/presentations/screens/discover_screen.dart';
import 'package:smart_tourist_guide/presentations/screens/favotite_screen.dart';
import 'package:smart_tourist_guide/presentations/screens/home_screen.dart';
import 'package:smart_tourist_guide/presentations/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main-screen';
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    HomeScreen(),
    DiscoverScreen(),

    ProfileScreen(),
  ];

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        // color: Colors.white,
        // shadowColor: Colors.black,
        // activeColor: Colors.white,
        // initialActiveIndex: currentpage,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: currentpage,
        onTap: (index) {
          setState(() {
            currentpage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outlined,
                size: 25,
              ),
              label: 'Discover'),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
                size: 25,
              ),
              label: 'logout'),
        ],
      ),
    );
  }
}
