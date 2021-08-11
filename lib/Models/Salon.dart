import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Salon {
  final String id;
  final String salonName;
  final String location;
  final String image;
  final String type;
  final String week;
  final String time;
  List<dynamic> mostAvailservices;

  Salon(
      {this.id,
      this.salonName,
      this.location,
      this.image,
      this.type,
      this.week,
      this.time,
      this.mostAvailservices = const []});

  factory Salon.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Salon(
      type: 'parlour',
      id: data['location']['serviceUid'],
      salonName: data['location']['name'] ?? '',
      location: data['location']['address'] ?? '',
      image: data['details']['parlourImage'] ?? '',
      mostAvailservices: data['mostAvailServices'] ?? [],
      week: data['slotList'][0]['weekRange'] ?? '',
      time: data['slotList'][0]['fromHr'] +
          ':' +
          data['slotList'][0]['fromMin'] +
          ' AM - ' +
          data['slotList'][0]['toHr'] +
          ':' +
          data['slotList'][0]['toMin'] +
          ' PM',
    );
  }
}
