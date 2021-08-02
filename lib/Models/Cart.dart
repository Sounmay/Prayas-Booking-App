import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cart {
  final String id;
  final List<String> serviceName;
  final List<int> price;
  final List<int> timeList;
  DateTime day;
  String timeSlot;
  int subtotal;
  int time;

  Cart(
      {@required this.id,
      @required this.serviceName,
      @required this.price,
      @required this.timeList,
      this.day,
      this.subtotal = 0,
      this.timeSlot,
      this.time = 0});

  Map<String, dynamic> toJson(String uid) => {
        "serviceId": uid,
        "isApproved": false,
        "id": id,
        "name": "naiyar",
        "serviceName": serviceName,
        "price": price,
        "serviceTimeList": timeList,
        "date": day,
        "timeslot": timeSlot,
        "amount": subtotal,
        "serviceTime": time
      };

  Cart addSlot(String slot) {
    this.timeSlot = slot;
    return this;
  }

  Cart addDay(DateTime day) {
    this.day = day;
    return this;
  }

  Cart addService(String service, int price, int min) {
    if (!this.serviceName.contains(service)) {
      this.subtotal += price;
      this.time += min;
      this.serviceName.add(service);
      this.price.add(price);
      this.timeList.add(min);
    }
    return this;
  }

  Cart removeService(String service) {
    int index = this.serviceName.indexOf(service);
    int tempPrice = this.price.elementAt(index);
    int tempTime = this.timeList.elementAt(index);
    this.subtotal -= tempPrice;
    this.time -= tempTime;
    this.serviceName.removeAt(index);
    this.price.removeAt(index);
    this.timeList.removeAt(index);
    return this;
  }
}
