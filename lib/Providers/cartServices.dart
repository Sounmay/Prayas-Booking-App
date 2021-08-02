import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Cart.dart';

class CartService with ChangeNotifier {
  Map<String, Cart> _services = {}; // change this

  Map<String, Cart> get services {
    return {..._services};
  }

  void addServices(String serviceId, String serviceName, int price, int min) {
    if (_services.containsKey(serviceId)) {
      _services.update(
          serviceId, (existing) => existing.addService(serviceName, price, min));
    } else {
      _services.putIfAbsent(
        serviceId,
        () => Cart(
            id: DateTime.now().toString(),
            serviceName: ["$serviceName"],
            price: [price],
            timeList: [min],
            subtotal: price,
            time: min
            ),
      );
    }
    notifyListeners();
  }

  void removeServices(String serviceId, String serviceName) {
    _services.update(
        serviceId, (existing) => existing.removeService(serviceName));
    notifyListeners();
  }

  void removeAllServices(String serviceId) {
    _services.remove(serviceId);
    notifyListeners();
  }
}
