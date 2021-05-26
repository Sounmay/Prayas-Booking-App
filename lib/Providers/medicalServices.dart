import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../Models/Medical.dart';

class MedicalServices with ChangeNotifier {
  List<Medical> _services = [
    Medical(clinicName: "Shri Clinic", name: "Dr. Haris Patel", location: "Sec 19, near library", id: "m1"),
    Medical(clinicName: "Shri Clinic2", name: "Dr. Haris Patel", location: "Sec 19, near library", id: "m2"),
    Medical(clinicName: "Shri Clinic3", name: "Dr. Haris Patel", location: "Sec 19, near library", id: "m3"),
  ];

  List<Medical> get services {
    return [..._services];
  }

}
