import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app/Models/Cart.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Medical>> streamMedical() {
    var ref = _db.collection('MedicalServices');

    return ref.snapshots().map(
        (event) => event.docs.map((e)  {if(e.data()["location"]["status"]=="Accepted")return Medical.fromFirestore(e);}).toList());
  }

  Stream<List<Parlour>> streamParlour() {
    var ref = _db.collection('ParlourServices');

    return ref.snapshots().map(
        (event) => event.docs.map((e) {if(e.data()["location"]["status"]=="Accepted") return Parlour.fromFirestore(e);}).toList());
  }

  Stream<List<Salon>> streamSalon() {
    var ref = _db.collection('SalonServices');

    return ref
        .snapshots()
        .map((event) => event.docs.map((e) { if(e.data()["location"]["status"]=="Accepted")return Salon.fromFirestore(e);}).toList());
  }

  Future changeUserAvatar(String imgUrl) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"image": imgUrl});
  }

  Future addBookingofCustomer(Cart service, String serviceId) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(service.id)
        .update({
      "bookings": FieldValue.arrayUnion([service.toJson(serviceId)])
    });
  }

  Future addCustomerBookingToServiceProvider(Cart service, String uid) async {
    await FirebaseFirestore.instance
        .collection('ServiceProviders')
        .doc(uid)
        .update({
      "event": FieldValue.arrayUnion([service.toJson(uid)])
    });
  }
}
