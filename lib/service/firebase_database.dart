import 'dart:math';

import 'package:animation/model/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference users =
      FirebaseFirestore.instance.collection('trips');

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

  static addTrips(Trips trips) async {
    await users.add(trips.toJson());
  }
}
