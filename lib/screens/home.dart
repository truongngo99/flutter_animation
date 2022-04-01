import 'dart:io';

import 'package:animation/model/trip.dart';
import 'package:animation/service/firebase_database.dart';
import 'package:animation/widget/add_trip.dart';
import 'package:animation/widget/list_trip.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddTripDialog();
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
