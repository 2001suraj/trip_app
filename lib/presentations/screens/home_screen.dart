import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_tourist_guide/presentations/widgets/best_place_widget.dart';
import 'package:smart_tourist_guide/presentations/widgets/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //slider
              CarouselSliderWidget(),

              //best place
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20),
                child: Text(
                  'Best Places',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              BestPlaceWidget(
                ref: FirebaseFirestore.instance.collection('ar'),
              ),
              //most visited
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20),
                child: Text(
                  'Most Visited',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              BestPlaceWidget(
                ref: FirebaseFirestore.instance.collection('most_visit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
