import 'package:animation/model/trip.dart';
import 'package:animation/screens/detail.dart';
import 'package:animation/service/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListTrip extends StatefulWidget {
  const ListTrip({Key? key}) : super(key: key);

  @override
  State<ListTrip> createState() => _ListTripState();
}

class _ListTripState extends State<ListTrip> {
  Widget _buildElement(
    BuildContext context,
    Trips trips,
  ) {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(id: trips.id ?? ''))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Hero(
                tag: 'dash-${trips.image}',
                child: Image.network(
                  '${trips.image}',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${trips.nights} nights',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 89, 179, 253),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    trips.name,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 133, 131, 131),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text("\$${trips.price}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Trips>>(
        stream: Database.getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _buildElement(context, snapshot.data![index]);
                });
          }
          return const CircularProgressIndicator();
        });
  }
}
