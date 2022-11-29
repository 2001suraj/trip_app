import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationModel {
  String name;
  String location;
  String image;
  String des1;
  String des2;
  double lat;
  double log;
  
  LocationModel({
    required this.name,
    required this.location,
    required this.image,
    required this.des1,
    required this.des2,
     required this.lat,
      required this.log
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'image': image,
      'des1': des1,
      'des2': des2,
      'lat': lat,
      'log': log,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] as String,
      location: map['location'] as String,
      image: map['image'] as String,
      des1: map['des1'] as String,
      des2: map['des2'] as String,
      lat: map['lat'] as double,
      log: map['log'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
