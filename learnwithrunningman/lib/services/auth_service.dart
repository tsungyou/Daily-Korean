import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  
  Future<User?> getOrCreateUser() async {
    if(currentUser == null) {
      print("start creating");
      await _firebaseAuth.signInAnonymously();
      print("start initializing");
      await setDefaultAdValue();
    } else {
      print(currentUser);
      print("nothing started");
    }
  return currentUser;
  }

  Future<void> setDefaultAdValue() async {
    // Youtube tutorial
    DocumentReference document = FirebaseFirestore.instance.collection("users").doc(AuthService().currentUser?.uid);
    document.get().then((documentSnapshot) {
      if(!documentSnapshot.exists) {
        document.set({"count": 0});
      }
    });
    if(currentUser != null) {
      // what I thought
      // await FirebaseFirestore.instance
      // .collection('users')
      // .doc(AuthService().currentUser?.uid)
      // .set({"count": 0});
      print("initialized default value");
    }
    else {
      print("current user to be null");
    }
  }
}