// import 'dart:convert';

// import 'package:animation/model/trip.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Database {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<List<Trips>> getData() async {
//     // List<Trips> trips = [];
//     var data =
//         firestore.collection('trips').withConverter<Trips>(fromFirestore: (snapshot,_)=> Trips.fromJson(snapshot.data()!), toFirestore: (trips,_)=> trips.toJson());
//     // data.docs.forEach((element) {
//     //   trips.add(Trips.fromJson(jsonDecode(element.data().toString())));
//     // });
//     // return trips;
//   }
// }
