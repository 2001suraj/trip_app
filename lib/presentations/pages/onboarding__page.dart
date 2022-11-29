import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:smart_tourist_guide/presentations/pages/login_page.dart';

class OnBoardingPage extends StatelessWidget {
  static const String routeName = 'onboarding page';
  OnBoardingPage({Key? key}) : super(key: key);
  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        doAnimateImage: true,
        imageAssetPath: 'assets/images/trip1.jpg',
        title: 'PLAN A TRIP',
        body:
            'Pla trips on more than 70 districts with few taps on your mobile screen'),
    PageModel(
        color: const Color(0xFF536DFE),
        doAnimateImage: true,
        imageAssetPath: 'assets/images/trip2.jpeg',
        title: 'START YOUR JOUNERY',
        body:
            'Hassle-free and quick tickets booking to any one of the 70 destication'),
    PageModel(
        color: const Color(0xFF9B90BC),
        doAnimateImage: true,
        imageAssetPath: 'assets/images/trip3.jpeg',
        title: 'TRIP SCHEDULE',
        body: 'Real time status to help you stay on top of your trip plan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        skipCallback: () {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        },
        finishCallback: () {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        },
      ),
    );
  }
}
