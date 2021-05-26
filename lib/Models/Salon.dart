import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Salon {
  final String id;
  final String salonName;
  final String location;
  final String image;

  Salon(
      {@required this.id,
      @required this.salonName,
      @required this.location,
      @required this.image});
}
