import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_tourist_guide/presentations/pages/individual_pages.dart';
import 'package:smart_tourist_guide/presentations/screens/main_screen.dart';

class DiscoverScreen extends StatefulWidget {
  static const String routeName = 'discover-screen';
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  TextEditingController search = TextEditingController();

  String nam = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        title: Text(
          'Discover Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // LocationTabs(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      nam = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: 400,
                child: StreamBuilder(
                    stream: (nam != '' && nam != null)
                        ? FirebaseFirestore.instance
                            .collection('all')
                            .where('key', arrayContains: nam)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('all')
                            .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IndividualPages(
                                            aa: snapshot.data!.docs[index])));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.091),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.lightBlueAccent)),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data!.docs[index]
                                                  ['image'],
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                      margin: EdgeInsets.all(10),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 35,
                                          width: 150,
                                          child: Text(
                                            snapshot.data!.docs[index]['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 150,
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['location'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text('aa');
                      }
                    }),
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LocationTabs extends StatefulWidget {
//   LocationTabs({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<LocationTabs> createState() => _LocationTabsState();
// }

// class _LocationTabsState extends State<LocationTabs> {
//   static const double lat = 27.7172;
//   static const double log = 85.3240;
//   CameraPosition defaultlocation =
//       CameraPosition(target: LatLng(lat, log), zoom: 5.5);

//   MapType currnetMap = MapType.normal;

  // void changeMapType() {
  //   setState(() {
  //     currnetMap =
  //         currnetMap == MapType.normal ? MapType.satellite : MapType.normal;
  //   });
  // }

  // var place = Places.place;
  // var place1 = Places.place1;
  // final CollectionReference ref =
  //     FirebaseFirestore.instance.collection('best_place');
  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       ListView.builder(
  //           scrollDirection: Axis.vertical,
  //           itemCount: 1,
  //           shrinkWrap: true,
  //           primary: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemBuilder: (context, index) {
  //             return StreamBuilder(
  //               stream: ref.snapshots(),
  //               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //                 if (snapshot.connectionState == ConnectionState.waiting) {
  //                   return Center(
  //                     child: CircularProgressIndicator(),
  //                   );
  //                 } else if (snapshot.hasData) {
  //                   var aa = snapshot.data!.docs[index];
  //                   return SizedBox(
  //                     height: MediaQuery.of(context).size.height * 0.81,
  //                     width: MediaQuery.of(context).size.width,
  //                     child: GoogleMap(
  //                       mapType: currnetMap,
  //                       myLocationEnabled: true,
  //                       myLocationButtonEnabled: true,
  //                       compassEnabled: true,
  //                       initialCameraPosition: defaultlocation,
  //                       markers: {
  //                         for (int i = 0; i < aa['name'].length; i++)
  //                           Marker(
  //                             markerId: MarkerId(aa['name'][i]),
  //                             position: LatLng((aa['lat']), (aa['log'])),
  //                             infoWindow: InfoWindow(
  //                               title: aa['name'],
  //                               // snippet: place[i].location,
  //                               // onTap: () {
  //                               //   Navigator.push(
  //                               //     context,
  //                               //     MaterialPageRoute(
  //                               //         builder: (context) =>
  //                               //             FromMapIndividualPages(
  //                               //                 place: place[i])),
  //                               //   );
  //                               // },
  //                             ),
  //                           ),
  //                         // for (int j = 0; j < place1.length; j++)
  //                         //   Marker(
  //                         //     markerId: MarkerId(place1[j].name),
  //                         //     position: LatLng(place1[j].lat, place1[j].log),
  //                         //     infoWindow: InfoWindow(
  //                         //         title: place1[j].name,
  //                         //         snippet: place1[j].location,
  //                         //         onTap: () {
  //                         //           Navigator.push(
  //                         //             context,
  //                         //             MaterialPageRoute(
  //                         //                 builder: (context) =>
  //                         //                     FromMapIndividualPages(
  //                         //                         place: place1[j])),
  //                         //           );
  //                         //         }),
  //                         //   ),
  //                       },
  //                     ),
  //                   );
  //                 } else {
  //                   return Text('error');
  //                 }
  //               },
  //             );

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.81,
              //   width: MediaQuery.of(context).size.width,
              //   child: GoogleMap(
              //     mapType: currnetMap,
              //     myLocationEnabled: true,
              //     myLocationButtonEnabled: true,
              //     compassEnabled: true,
              //     initialCameraPosition: defaultlocation,
              //     markers: {
              //       for (int i = 0; i < place.length; i++)
              //         Marker(
              //           markerId: MarkerId(place[i].name),
              //           position: LatLng(place[i].lat, place[i].log),
              //           infoWindow: InfoWindow(
              //             title: place[i].name,
              //             snippet: place[i].location,
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         FromMapIndividualPages(place: place[i])),
              //               );
              //             },
              //           ),
              //         ),
              //       for (int j = 0; j < place1.length; j++)
              //         Marker(
              //           markerId: MarkerId(place1[j].name),
              //           position: LatLng(place1[j].lat, place1[j].log),
              //           infoWindow: InfoWindow(
              //               title: place1[j].name,
              //               snippet: place1[j].location,
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           FromMapIndividualPages(
              //                               place: place1[j])),
              //                 );
              //               }),
              //         ),
              //     },
              //   ),
              // );
//             }),
//       ],
//     );
//   }
// }

//  SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.81,
//                 width: MediaQuery.of(context).size.width,
//                 child: GoogleMap(
//                   mapType: currnetMap,
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,
//                   compassEnabled: true,
//                   initialCameraPosition: defaultlocation,
//                   markers: {
//                     for (int i = 0; i < place.length; i++)
//                       Marker(
//                         markerId: MarkerId(place[i].name),
//                         position: LatLng(place[i].lat, place[i].log),
//                         infoWindow: InfoWindow(
//                           title: place[i].name,
//                           snippet: place[i].location,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FromMapIndividualPages(place: place[i])),
//                             );
//                           },
//                         ),
//                       ),
//                     for (int j = 0; j < place1.length; j++)
//                       Marker(
//                         markerId: MarkerId(place1[j].name),
//                         position: LatLng(place1[j].lat, place1[j].log),
//                         infoWindow: InfoWindow(
//                             title: place1[j].name,
//                             snippet: place1[j].location,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         FromMapIndividualPages(
//                                             place: place1[j])),
//                               );
//                             }),
//                       ),
//                   },
//                 ),
//               );
