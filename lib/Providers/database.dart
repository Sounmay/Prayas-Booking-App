import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Medical>> streamMedical() {
    var ref = _db.collection('MedicalServices');

    return ref.snapshots().map(
        (event) => event.docs.map((e) => Medical.fromFirestore(e)).toList());
  }

  Stream<List<Parlour>> streamParlour() {
    var ref = _db.collection('ParlourServices');

    return ref.snapshots().map(
        (event) => event.docs.map((e) => Parlour.fromFirestore(e)).toList());
  }

  Stream<List<Salon>> streamSalon() {
    var ref = _db.collection('SalonServices');

    return ref
        .snapshots()
        .map((event) => event.docs.map((e) => Salon.fromFirestore(e)).toList());
  }

  Future changeUserAvatar(String imgUrl) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"image": imgUrl});
  }
}
