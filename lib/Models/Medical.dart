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
      type: "medical",
      id: data["location"]["serviceUid"],
      clinicName: data["location"]["clinicName"] ?? "",
      name: data[""]["name"] ?? "",
      location: data["location"]["address"] ?? "",
      image: data["location"]["clinicImage"] ?? "",
      // speciality: data["speciality"] ?? ""
    );
  }
}
