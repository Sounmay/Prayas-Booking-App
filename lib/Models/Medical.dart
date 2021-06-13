import 'package:cloud_firestore/cloud_firestore.dart';

class Medical {
  final String id;
  final String clinicName;
  final String name;
  final String location;
  final String image;
  final String speciality;
  final String type;

  Medical(
      {this.id,
      this.clinicName,
      this.name,
      this.location,
      this.image,
      this.speciality,
      this.type});

  factory Medical.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Medical(
        type: 'medical',
        id: doc.id,
        clinicName: data['clinicName'] ?? '',
        name: data['name'] ?? '',
        location: data['location'] ?? '',
        image: data['image'] ?? '',
        speciality: data['speciality'] ?? '');
  }
}
