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
      {@required this.id,
      @required this.clinicName,
      @required this.name,
      @required this.location,
      @required this.image, 
      @required this.speciality});
}
