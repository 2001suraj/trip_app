// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_tourist_guide/data/model/place_model.dart';
import 'package:smart_tourist_guide/presentations/pages/individual_pages.dart';

class BestPlaceWidget extends StatelessWidget {
  BestPlaceWidget({
    required this.ref,
    Key? key,
  }) : super(key: key);

  final CollectionReference ref;

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
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var place = snapshot.data!.docs[index];
                return Container(
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  IndividualPages(aa: place)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 240,
                      margin: EdgeInsets.only(left: 10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(place['image']),
                                  fit: BoxFit.cover),
                            ),
                            height: 200,
                          ),
                          Positioned(
                            top: 160,
                            right: 0,
                            left: 30,
                            child: Text(
                              place['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 220,
                            left: 10,
                            right: 10,
                            child: Text(
                              place['des1'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('error');
          }
        },
      ),
    );
   
  }
}
