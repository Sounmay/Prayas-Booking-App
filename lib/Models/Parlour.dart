import 'package:cloud_firestore/cloud_firestore.dart';

class Parlour {
  final String id;
  final String parlourName;
  final String location;
  final String image;
  List<dynamic> mostAvailservices;

  Parlour(
      {this.id,
      this.parlourName,
      this.location,
      this.image,
      this.mostAvailservices = const []});

  factory Parlour.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Parlour(
        id: doc.id,
        parlourName: data['parlourName'] ?? '',
        location: data['location'] ?? '',
        image: data['image'] ?? '',
        mostAvailservices: data['mostAvailServices'] ?? []);
  }
}
