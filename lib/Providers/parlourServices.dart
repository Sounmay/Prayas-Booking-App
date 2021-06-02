import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';

class ParlourServices with ChangeNotifier {
  List<Parlour> _services = [
    Parlour(
        image: 'assets/parlourThumbnail.png',
        parlourName: "Perfect parlour",
        location: "Sec 19, near library",
        id: "m1",
        mostAvailservices: [
          {"serviceName": "HairCut", "price": 300, "time": 30},
          {"serviceName": "Shaving", "price": 200, "time": 20},
          {"serviceName": "Facial", "price": 250, "time": 15},
          {"serviceName": "Massage", "price": 50, "time": 35},
          {"serviceName": "Foot Mass.", "price": 50, "time": 35},
        ]),
    Parlour(
        image: 'assets/parlourThumbnail.png',
        parlourName: "Perfect parlour2",
        location: "Sec 20, near library",
        id: "m2"),
    Parlour(
        image: 'assets/parlourThumbnail.png',
        parlourName: "Perfect parlour3",
        location: "Sec 21, near library",
        id: "m3",
        mostAvailservices: [
          {"serviceName": "HairCut", "price": 300, "time": 30},
          {"serviceName": "Shaving", "price": 200, "time": 20},
          {"serviceName": "Facial", "price": 250, "time": 15},
          {"serviceName": "Massage", "price": 50, "time": 35},
          {"serviceName": "Foot Mass.", "price": 50, "time": 35},
        ]),
  ];

  List<Parlour> get services {
    return [..._services];
  }

  Parlour findById(String id) {
    return _services.firstWhere((element) => element.id == id);
  }
}
