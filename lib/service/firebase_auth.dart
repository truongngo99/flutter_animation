import 'dart:async';

import 'package:animation/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  Future<bool> login(String email, String password) async {
    try {
      UserCredential? user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(
      String email, String password, String firstName, String lastName) async {
    try {
      UserCredential user = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(await postDetailUser(firstName, lastName))
          .catchError((e) => print(e));
      return true;
    } catch (e) {
      print('LOG: $e');
      return false;
    }
  }

  postDetailUser(String firstName, String lastName) async {
    User? user = auth.currentUser;
    final userModel = UserModel(
        email: user!.email,
        firstName: firstName,
        lastName: lastName,
        uid: user.uid);

    await _storage.collection('users').doc(user.uid).set(userModel.toJson());
  }
}
