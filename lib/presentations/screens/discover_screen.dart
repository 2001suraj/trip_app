import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_tourist_guide/data/model/place_model.dart';
import 'package:smart_tourist_guide/presentations/pages/from_map_individual_page.dart';
import 'package:smart_tourist_guide/presentations/pages/individual_pages.dart';
import 'package:smart_tourist_guide/presentations/screens/main_screen.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = 'discover-screen';
  const DiscoverScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: LocationTabs(),
      ),
    );
  }
}

class LocationTabs extends StatefulWidget {
  LocationTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationTabs> createState() => _LocationTabsState();
}

class _LocationTabsState extends State<LocationTabs> {
  static const double lat = 27.7172;
  static const double log = 85.3240;
  CameraPosition defaultlocation =
      CameraPosition(target: LatLng(lat, log), zoom: 5.5);

  MapType currnetMap = MapType.normal;

  void changeMapType() {
    setState(() {
      currnetMap =
          currnetMap == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  var place = Places.place;
  var place1 = Places.place1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            shrinkWrap: true,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.81,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  mapType: currnetMap,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                  initialCameraPosition: defaultlocation,
                  markers: {
                    for (int i = 0; i < place.length; i++)
                      Marker(
                        markerId: MarkerId(place[i].name),
                        position: LatLng(place[i].lat, place[i].log),
                        infoWindow: InfoWindow(
                          title: place[i].name,
                          snippet: place[i].location,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FromMapIndividualPages(place: place[i])),
                            );
                          },
                        ),
                      ),
                    for (int j = 0; j < place1.length; j++)
                      Marker(
                        markerId: MarkerId(place1[j].name),
                        position: LatLng(place1[j].lat, place1[j].log),
                        infoWindow: InfoWindow(
                            title: place1[j].name,
                            snippet: place1[j].location,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FromMapIndividualPages(
                                            place: place1[j])),
                              );
                            }),
                      ),
                  },
                ),
              );
            }),
      ],
    );
  }
}
