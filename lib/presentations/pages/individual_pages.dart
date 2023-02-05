// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_tourist_guide/data/local_storage/share_preference.dart';
import 'package:smart_tourist_guide/data/model/place_model.dart';
import 'package:smart_tourist_guide/data/repo/location_repo.dart';
import 'package:smart_tourist_guide/presentations/screens/main_screen.dart';

class IndividualPages extends StatelessWidget {
  static const String routeName = 'individualpage';
  IndividualPages({Key? key, required this.aa}) : super(key: key);

  // Places place;
  QueryDocumentSnapshot<Object?> aa;

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
                ImageContainer(aa: aa),
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
        height: 750,
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
              aa['name'],
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              aa['des1'],
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              aa['des2'],
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
                      position: LatLng(aa['lat'], aa['log']),
                      infoWindow: InfoWindow(title: aa['name']))
                },
                initialCameraPosition: CameraPosition(
                  zoom: 15,
                  target: LatLng(aa['lat'], aa['log']),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatefulWidget {
  const ImageContainer({
    Key? key,
    required this.aa,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> aa;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  bool isfav = true;

  @override
  Widget build(BuildContext context) {
    var place = [
      Places(
          photourl: widget.aa['image'],
          location: widget.aa['location'],
          des1: widget.aa['des1'],
          des2: widget.aa['des2'],
          name: widget.aa['name'],
          lat: widget.aa['lat'],
          log: widget.aa['log'])
    ];
    return Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.aa['image']), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, MainScreen.routeName);
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
            // isfav == true
            //     ? FutureBuilder(
            //         future: LocalStorage().readdata(),
            //         builder: (context, snapshot) {
            //           return MaterialButton(
            //             onPressed: () {
            //               WriteRepo().fav(
            //                   fname: snapshot.data!.toString(),
            //                   name: widget.aa['name'],
            //                   location: widget.aa['location'],
            //                   des1: widget.aa['des1'],
            //                   des2: widget.aa['des2'],
            //                   lat: widget.aa['lat'],
            //                   log: widget.aa['log'],
            //                   image: widget.aa['image']);
            //               setState(() {
            //                 isfav = false;
            //               });

            //               // Navigator.push(
            //               //     context,
            //               //     MaterialPageRoute(
            //               //         builder: (context) => FavoriteScreen()));
            //             },
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10)),
            //             height: 40,
            //             minWidth: 20,
            //             color: Colors.white,
            //             child: Icon(
            //               Icons.favorite_border,
            //               color: Colors.black,
            //             ),
            //           );
            //         },
            //       )
            //     : MaterialButton(
            //         onPressed: () {
            //           final uu = FirebaseFirestore.instance
            //               .collection('fav')
            //               .doc(widget.aa['name']);
            //           uu.delete();
            //           setState(() {
            //             isfav = true;
            //           });
            //         },
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         height: 40,
            //         minWidth: 20,
            //         color: Colors.white,
            //         child: Icon(
            //           Icons.favorite,
            //           color: Colors.red,
            //         ),
            //       ),
          ],
        ),
      ),
    );
  }
}
