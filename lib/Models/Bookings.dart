import 'package:cloud_firestore/cloud_firestore.dart';

class BookingsDetails {
  String otp, timeslot, uid;
  Timestamp date;
  bool isApproved;

  BookingsDetails({this.otp, this.timeslot, this.date, this.isApproved});

  BookingsDetails.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    timeslot = json['timeslot'];
    date = json['date'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['timeslot'] = this.timeslot;
    data['date'] = this.date;
    data['isApproved'] = this.isApproved;
    return data;
  }
}
