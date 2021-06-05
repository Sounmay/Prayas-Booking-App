import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Salon {
  final String id;
  final String salonName;
  final String location;
  final String image;
  List<dynamic> mostAvailservices;

  Salon(
      {this.id,
      this.salonName,
      this.location,
      this.image,
      this.mostAvailservices = const []});

  factory Salon.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Salon(
      id: doc.id,
      salonName: data['salonName'] ?? '',
      location: data['location'] ?? '',
      image: data['image'] ?? '',
      mostAvailservices: data['mostAvailservices']
    );
  }
}
