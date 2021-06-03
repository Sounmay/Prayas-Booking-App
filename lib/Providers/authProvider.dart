import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app/Models/User.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: (email), password: (password));
      User user = result.user;

      
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String name, bool isAuth, String number, String password) async {
    try {
      String numemail = number + "@gmail.com";
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: (numemail), password: (password));
      User user = result.user;

      FirebaseFirestore.instance.collection('Users').doc("${user.uid}").set({
        "name": name
      });

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
