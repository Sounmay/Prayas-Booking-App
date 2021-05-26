import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Medical {
  final String id;
  final String clinicName;
  final String name;
  final String location;

  Medical(
      {@required this.id,
      @required this.clinicName,
      @required this.name,
      @required this.location});
}
