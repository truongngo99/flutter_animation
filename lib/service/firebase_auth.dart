import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    try {
      UserCredential? user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      print('LOG: $e');
      return false;
    }
  }
}
