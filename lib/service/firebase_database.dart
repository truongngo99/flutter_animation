import 'dart:io';
import 'package:animation/model/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Database {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference users =
      FirebaseFirestore.instance.collection('trips');
  static String downloadURl = '';

  static Stream<List<Trips>> getData() {
    return firestore.collection('trips').snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();

        json.addAll({
          "id": e.id,
        });

        return Trips.fromJson(json);
      }).toList();
    });
  }

  static addTrips(Trips trips, File file) async {
    uploadFile(file);

    trips = trips.copyWith(image: downloadURl);

    await FirebaseFirestore.instance
        .collection('trips')
        .doc()
        .set(trips.toJson());
  }

  static uploadFile(File file) async {
    final idImage = DateTime.now().millisecondsSinceEpoch;
    Reference reference =
        FirebaseStorage.instance.ref().child('images').child('post_$idImage');
    await reference.putFile(file);
    downloadURl = await reference.getDownloadURL();
  }
}
