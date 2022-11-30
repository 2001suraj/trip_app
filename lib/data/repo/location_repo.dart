import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tourist_guide/data/model/location_model.dart';

class WriteRepo {
  FirebaseFirestore storage = FirebaseFirestore.instance;
  Future best_place(
      {required String name,
      required String location,
      required String des1,
      required String des2,
      required double lat,
      required double log,
      required String image}) async {
    var info = storage.collection('best_place').doc(name);

    info.set(LocationModel(
            name: name,
            location: location,
            image: image,
            des1: des1,
            des2: des2,
            lat: lat,
            log: log)
        .toMap());
  }

  Future most_visit(
      {required String name,
      required String location,
      required String des1,
      required String des2,
      required double lat,
      required double log,
      required String image}) async {
    var info = storage.collection('most_visit').doc(name);

    info.set(LocationModel(
            name: name,
            location: location,
            image: image,
            des1: des1,
            des2: des2,
            lat: lat,
            log: log)
        .toMap());
  }

  Future fav(
      {required String name,
      required String location,
      required String des1,
      required String des2,
      required double lat,
      required double log,
      required String image}) async {
    var info = storage.collection('fav').doc(name);

    info.set(LocationModel(
            name: name,
            location: location,
            image: image,
            des1: des1,
            des2: des2,
            lat: lat,
            log: log)
        .toMap());
  }
}
