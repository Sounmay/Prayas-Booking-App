import 'package:flutter/foundation.dart';

class Location {
  String address;

  Location({this.address = ""});
}

class LocationProvider with ChangeNotifier {
  List<Location> _address = [];

  List<Location> get address {
    return [..._address];
  }

  void addLocation(String addr) {
    if (addr != "" && addr != null) {
      _address.add(Location(address: addr));
    }
    notifyListeners();
  }
}
