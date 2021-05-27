import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';

class ParlourServices with ChangeNotifier {
  List<Parlour> _services = [
    Parlour(image: 'assets/parlourThumbnail.png', parlourName: "Perfect parlour", location: "Sec 19, near library", id: "m1"),
    Parlour(image: 'assets/parlourThumbnail.png', parlourName: "Perfect parlour2", location: "Sec 20, near library", id: "m2"),
    Parlour(image: 'assets/parlourThumbnail.png', parlourName: "Perfect parlour3", location: "Sec 21, near library", id: "m3"),
  ];

  List<Parlour> get services {
    return [..._services];
  }

}
