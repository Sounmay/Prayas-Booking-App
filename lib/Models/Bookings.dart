import 'package:cloud_firestore/cloud_firestore.dart';

class BookingsDetails {
  String otp, timeslot, shopName, uid;
  int totalAmount;
  Timestamp date;
  bool isApproved;
  List priceList, serviceList, serviceTimeList;

  BookingsDetails(
      {this.otp,
      this.timeslot,
      this.shopName,
      this.priceList,
      this.serviceList,
      this.serviceTimeList,
      this.date,
      this.totalAmount,
      this.isApproved});

  BookingsDetails.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    priceList = json['price'];
    totalAmount = json['amount'];
    serviceList = json['serviceName'];
    serviceTimeList = json['serviceTimeList'];
    timeslot = json['timeslot'];
    date = json['date'];
    isApproved = json['isApproved'];
    shopName = json['shopName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['price'] = this.priceList;
    data['amount'] = this.totalAmount;
    data['serviceName'] = this.serviceList;
    data['serviceTimeList'] = this.serviceTimeList;
    data['timeslot'] = this.timeslot;
    data['date'] = this.date;
    data['isApproved'] = this.isApproved;
    data['shopName'] = this.shopName;
    return data;
  }
}
