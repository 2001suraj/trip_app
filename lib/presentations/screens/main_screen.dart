// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        shadowColor: Colors.black,
        activeColor: Colors.white,
        initialActiveIndex: currentpage,
        onTap: (index) {
          setState(() {
            currentpage = index;
          });
        },
        items: [
          TabItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              title: 'Home'),
          TabItem(
              icon: Icon(
                Icons.play_circle_outlined,
                size: 25,
              ),
              title: 'Discover'),
          TabItem(
              icon: Icon(
                Icons.favorite,
                size: 25,
              ),
              title: 'Favorite'),
          TabItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              title: 'profile'),
        ],
      ),
    );
  }
}
