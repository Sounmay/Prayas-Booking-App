import 'package:cloud_firestore/cloud_firestore.dart';

class Parlour {
  final String id;
  final String parlourName;
  final String location;
  final String image;
  final String type;
  final String week;
  final String time;
  List<dynamic> mostAvailservices;

  Parlour(
      {this.id,
      this.parlourName,
      this.location,
      this.image,
      this.type,
      this.week,
      this.time,
      this.mostAvailservices = const []});

  factory Parlour.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Parlour(
      type: 'parlour',
      id: data['location']['serviceUid'],
      parlourName: data['location']['name'] ?? '',
      location: data['location']['address'] ?? '',
      image: data['details']['parlourImage'] ?? '',
      mostAvailservices: data['mostAvailServices'] ?? [],
      week: data['slotList'][0]['weekRange'] ?? '',
      time: data['slotList'][0]['fromHr'] +
          ':' +
          data['slotList'][0]['fromMin'] +
          ' AM - ' +
          data['slotList'][0]['toHr'] +
          ':' +
          data['slotList'][0]['toMin'] +
          ' PM',
    );
  }
}

//new parlourModel

class Location {
  String serviceUid;
  String name;
  String shopNo;
  String address;
  String ownerImage;
  String ownerName;
  String ownerNumber;
  String aboutOwner;
  String latitude;
  String longitude;

  Location(
      {this.name,
      this.serviceUid,
      this.latitude,
      this.longitude,
      this.shopNo,
      this.address,
      this.ownerImage,
      this.ownerName,
      this.ownerNumber,
      this.aboutOwner});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shopNo = json['shopNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceUid = json['serviceUid'];
    ownerImage = json['ownerImage'];
    ownerName = json['ownerName'];
    ownerNumber = json['ownerNumber'];
    aboutOwner = json['aboutOwner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['ownerImage'] = this.ownerImage;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['ownerName'] = this.ownerName;
    data['ownerNumber'] = this.ownerNumber;
    data['aboutOwner'] = this.aboutOwner;
    data['serviceUid'] = this.serviceUid;
    return data;
  }
}

class Details {
  String parlourType;
  String aboutParlour;
  String numOfEmployees;
  String parlourImage;

  Details(
      {this.parlourType,
      this.aboutParlour,
      this.parlourImage,
      this.numOfEmployees});

  Details.fromJson(Map<String, dynamic> json) {
    parlourType = json['parlourType'];
    aboutParlour = json['aboutParlour'];
    parlourImage = json['parlourImage'];
    numOfEmployees = json['numOfEmployees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parlourType'] = this.parlourType;
    data['aboutParlour'] = this.aboutParlour;
    data['parlourImage'] = this.parlourImage;
    data['numOfEmployees'] = this.numOfEmployees;

    return data;
  }
}

class EmployeeDetailList {
  String name;
  String number;
  String imagefile;

  EmployeeDetailList({this.name, this.number, this.imagefile});

  EmployeeDetailList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    imagefile = json['imagefile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['imagefile'] = this.imagefile;
    return data;
  }
}

class ParlourServiceDetails {
  String name, price, hour, minute;

  ParlourServiceDetails({this.name, this.price, this.hour, this.minute});

  ParlourServiceDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    hour = json['hour'];
    minute = json['minute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    return data;
  }
}

class ParlourSlotDetails {
  String weekRange, fromHr, fromMin, toHr, toMin;

  ParlourSlotDetails(
      {this.weekRange, this.fromHr, this.fromMin, this.toHr, this.toMin});

  ParlourSlotDetails.fromJson(Map<String, dynamic> json) {
    weekRange = json['weekRange'];
    fromHr = json['fromHr'];
    fromMin = json['fromMin'];
    toHr = json['toHr'];
    toMin = json['toMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekRange'] = this.weekRange;
    data['fromHr'] = this.fromHr;
    data['fromMin'] = this.fromMin;
    data['toHr'] = this.toHr;
    data['toMin'] = this.toMin;
    return data;
  }
}
