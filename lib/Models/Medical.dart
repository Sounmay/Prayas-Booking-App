import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Medical {
  final String id;
  final String clinicName;
  final String name;
  final String location;
  final String image;
  final String speciality;

  Medical(
      {this.id,
      this.clinicName,
      this.name,
      this.location,
      this.image,
      this.speciality});

  factory Medical.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Medical(
      id: doc.id,
      clinicName: data['clinicName'] ?? '',
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      image: data['image'] ?? '',
      speciality: data['speciality'] ?? ''
    );
  }
}
