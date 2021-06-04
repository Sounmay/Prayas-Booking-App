import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Salon {
  final String id;
  final String salonName;
  final String location;
  final String image;
  List<Map<String, dynamic>> mostAvailservices;

  Salon(
      {this.id,
      this.salonName,
      this.location,
      this.image,
      this.mostAvailservices = const []});
}
