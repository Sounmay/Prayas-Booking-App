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
  List<dynamic> slotArray;
  Map bookedSlotsPerDay;

  Salon(
      {this.id,
      this.salonName,
      this.location,
      this.slotArray,
      this.bookedSlotsPerDay,
      this.image,
      this.type,
      this.week,
      this.time,
      this.mostAvailservices = const []});

  factory Salon.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    int fromHr = int.parse(data['slotList'][0]['fromHr']);
    int toHr = int.parse(data['slotList'][0]['toHr']);
    int finalFromHr = fromHr > 12 ? fromHr - 12 : fromHr;
    int finalToHr = toHr > 12 ? toHr - 12 : toHr;
    String startAmPm = fromHr < 12 ? " AM - " : " PM - ";
    String endAmPm = toHr < 12 ? " AM" : " PM";

    return Salon(
      type: 'salon',
      id: data['location']['serviceUid'],
      salonName: data['location']['name'] ?? '',
      location: data['location']['address'] ?? '',
      image: data['details']['parlourImage'] ?? '',
      mostAvailservices: data['mostAvailServices'] ?? [],
      slotArray: data['slots'] ?? [],
      week: data['slotList'][0]['weekRange'] ?? '',
      bookedSlotsPerDay: data['bookedSlotsPerDay'] ?? {},
      time: finalFromHr.toString() +
          ':' +
          data['slotList'][0]['fromMin'] +
          startAmPm +
          finalToHr.toString() +
          ':' +
          data['slotList'][0]['toMin'] +
          endAmPm,
    );
  }
}
