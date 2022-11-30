// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_tourist_guide/presentations/pages/individual_pages.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('location');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 600,
      child: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: ((context, index, realIndex) {
                var ddata = snapshot.data!.docs[index];

                return InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, IndividualPages.routeName,
                        arguments: ddata);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.96,
                    margin: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(ddata['image']),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 200.0,
                        left: 40,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ddata['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.near_me_sharp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  ddata['location'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                height: 320,
                viewportFraction: 1,
                autoPlay: true,
                // aspectRatio: 3 / 2,
              ),
            );
          } else {
            return Text('error');
          }
        },
      ),
    );
  }
}
