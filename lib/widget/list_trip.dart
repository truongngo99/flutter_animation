import 'package:animation/model/trip.dart';
import 'package:animation/screens/detail.dart';
import 'package:flutter/material.dart';

class ListTrip extends StatefulWidget {
  const ListTrip({Key? key}) : super(key: key);

  @override
  State<ListTrip> createState() => _ListTripState();
}

class _ListTripState extends State<ListTrip> {
  final List<Trip> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListTrip();
  }

  createListTrip() {
    List<Trip> _listTrip = [
      Trip('beach.png', 'Beach Paradise', 399.9, 3),
      Trip('city.png', 'City Break', 299.9, 5),
      Trip('space.png', 'Space Blast', 549.9, 2),
      Trip('ski.png', 'Space Blast', 600.9, 4),
    ];

    _listTrip.forEach((element) {
      _list.add(element);
    });
  }

  Widget _buildElement(Trip trip) {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(trip: trip))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Hero(
                tag: 'dash-${trip.image}',
                transitionOnUserGestures: true,
                child: Image.asset(
                  'assets/images/${trip.image}',
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
                    '${trip.numNight} nights',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 89, 179, 253),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    trip.title,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 133, 131, 131),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text("\$${trip.price}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return _buildElement(_list[index]);
        });
  }
}
