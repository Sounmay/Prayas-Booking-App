import 'package:cloud_firestore/cloud_firestore.dart';

class Parlour {
  final String id;
  final String parlourName;
  final String location;
  final String image;
  final String type;
  List<dynamic> mostAvailservices;

  Parlour(
      {this.id,
      this.parlourName,
      this.location,
      this.image,
      this.type,
      this.mostAvailservices = const []});

  factory Parlour.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Parlour(
        type: 'parlour',
        id: doc.id,
        parlourName: data['location']['name'] ?? '',
        location: data['location']['address'] ?? '',
        image: data['location']['image'] ?? '',
        mostAvailservices: data['mostAvailServices'] ?? []);
  }
}
