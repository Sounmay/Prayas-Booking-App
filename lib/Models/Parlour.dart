import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Parlour {
  final String id;
  final String parlourName;
  final String location;
  final String image;
  List<Map<String, dynamic>> mostAvailservices;

  Parlour(
      {@required this.id,
      @required this.parlourName,
      @required this.location,
      @required this.image,
      this.mostAvailservices = const []
      });
}
