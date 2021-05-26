import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Parlour {
  final String id;
  final String parlourName;
  final String location;
  final String image;

  Parlour(
      {@required this.id,
      @required this.parlourName,
      @required this.location,
      @required this.image});
}
