import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  
  Future<User?> getOrCreateUser() async {
    if(currentUser == null) {
      await _firebaseAuth.signInAnonymously();
      await setDefaultAdValue();
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
    }
    else {
    }
  }
}