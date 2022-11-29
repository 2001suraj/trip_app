// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_tourist_guide/data/model/place_model.dart';

class FromMapIndividualPages extends StatelessWidget {
  FromMapIndividualPages({Key? key, required this.place}) : super(key: key);

  Places place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.2,
            child: Stack(
              children: [
                imagecContainer(context),
                detailsContainer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned detailsContainer(BuildContext context) {
    return Positioned(
      top: 300,
      right: 0,
      left: 0,
      child: Container(
        height: 700,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              place.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              place.des1,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              place.des2,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Location',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            // map
            Container(
              // margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),

              height: 200,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              child: GoogleMap(
                markers: <Marker>{
                  Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(place.lat, place.log),
                      infoWindow: InfoWindow(title: place.name))
                },
                initialCameraPosition: CameraPosition(
                  zoom: 15,
                  target: LatLng(place.lat, place.log),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Container imagecContainer(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(place.photourl), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              height: 40,
              minWidth: 20,
              color: Colors.white,
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
