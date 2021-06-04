import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';

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
}
