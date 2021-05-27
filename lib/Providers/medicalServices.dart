import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../Models/Medical.dart';

class MedicalServices with ChangeNotifier {
  List<Medical> _services = [
    Medical(speciality: 'Orthopedic1', image: 'assets/Ellipse.png', clinicName: "Shri Clinic", name: "Dr. Haris Patel", location: "Sec 19, near library", id: "m1"),
    Medical(speciality: 'Orthopedic2', image: 'assets/Ellipse.png', clinicName: "Shri Clinic2", name: "Dr. Haris Patel", location: "Sec 20, near library", id: "m2"),
    Medical(speciality: 'Orthopedic3', image: 'assets/Ellipse.png', clinicName: "Shri Clinic3", name: "Dr. Haris Patel", location: "Sec 21, near library", id: "m3"),
  ];

  List<Medical> get services {
    return [..._services];
  }

}
