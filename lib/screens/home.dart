import 'dart:io';

import 'package:animation/model/trip.dart';
import 'package:animation/service/firebase_database.dart';
import 'package:animation/widget/list_trip.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController ctrlNameTrip = TextEditingController();
  final TextEditingController ctrlDescription = TextEditingController();
  final TextEditingController ctrlNight = TextEditingController();
  final TextEditingController ctrlPrice = TextEditingController();
  File? file;
  final _imagePicker = ImagePicker();

  Future imagePickerMethod() async {
    final result = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (result != null) {
        file = File(result.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 160,
              child: Text(
                'Ninja Trips',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTrip(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Trip'),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: ctrlNameTrip,
                        decoration: InputDecoration(hintText: 'Name Trip'),
                      ),
                      TextField(
                        controller: ctrlDescription,
                        decoration: InputDecoration(hintText: 'Description'),
                      ),
                      TextField(
                        controller: ctrlNight,
                        decoration: InputDecoration(hintText: 'Night'),
                      ),
                      TextField(
                        controller: ctrlPrice,
                        decoration: InputDecoration(hintText: 'Price'),
                      ),
                      Text('Photo'),
                      Container(
                        width: 70,
                        height: 70,
                        child: file == null
                            ? const SizedBox.shrink()
                            : Image.file(file!),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            imagePickerMethod();
                          },
                          child: const Text('Add Photo')),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close')),
                  TextButton(
                    onPressed: () {
                      final trips = Trips(
                          name: ctrlNameTrip.text,
                          price: double.parse(ctrlPrice.text),
                          nights: int.parse(ctrlNight.text),
                          image: 'space.png',
                          description: ctrlDescription.text);
                      Database.addTrips(trips);
                    },
                    child: Text('Add'),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 105, 183, 247),
        ),
        tooltip: 'Add Trips',
      ),
    );
  }
}
