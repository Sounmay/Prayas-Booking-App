import 'package:cloud_firestore/cloud_firestore.dart';

class Medical {
  final String id;
  final String clinicName;
  final String name;
  final String location;
  final String image;
  final String speciality;
  final String type;
  final ClinicLocationAndDoctor clinicLocationAndDoctor;
  final List<DoctorDetails> doctorDetails;
  final AdminDetails adminDetails;

  Medical(
      {this.clinicLocationAndDoctor,
      this.doctorDetails,
      this.adminDetails,
      this.id,
      this.clinicName,
      this.name,
      this.location,
      this.image,
      this.speciality,
      this.type});

  factory Medical.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Medical(
        type: "medical",
        id: data["location"]["serviceUid"],
        clinicName: data["location"]["clinicName"] ?? "",
        name: data["doctorList"][0]["name"] ?? "",
        location: data["location"]["address"] ?? "",
        image: data["location"]["clinicImage"] ?? "",
        speciality: data["doctorList"][0]["specialization"] ?? "",
        clinicLocationAndDoctor:
            ClinicLocationAndDoctor.fromJson(data["location"]),
        doctorDetails: List<DoctorDetails>.from(
            data["doctorList"].map((x) => DoctorDetails.fromJson(x))),
        adminDetails: AdminDetails.fromJson(data["adminDetails"]));
  }
}

//model from service side
class ClinicLocationAndDoctor {
  String serviceUid;
  String clinicName;
  String shopNo;
  String address;
  String doctorImage;
  String clinicImage;
  String doctorName;
  String doctorExperience;
  String doctorNumber;
  String speciality;
  String aboutClinic;
  String latitude;
  String aboutDoctor;
  String longitude;

  ClinicLocationAndDoctor(
      {this.clinicName,
      this.serviceUid,
      this.doctorExperience,
      this.clinicImage,
      this.latitude,
      this.longitude,
      this.shopNo,
      this.address,
      this.doctorImage,
      this.speciality,
      this.doctorName,
      this.doctorNumber,
      this.aboutDoctor,
      this.aboutClinic});

  ClinicLocationAndDoctor.fromJson(Map<String, dynamic> json) {
    clinicName = json['clinicName'];
    shopNo = json['shopNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceUid = json['serviceUid'];
    doctorImage = json['doctorImage'];
    clinicImage = json['clinicImage'];
    doctorExperience = json['doctorExperience'];
    doctorName = json['doctorName'];
    doctorNumber = json['doctorNumber'];
    aboutClinic = json['aboutClinic'];
    aboutDoctor = json['aboutDoctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicName'] = this.clinicName;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['doctorImage'] = this.doctorImage;
    data['clinicImage'] = this.clinicImage;
    data['doctorExperience'] = this.doctorExperience;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['doctorName'] = this.doctorName;
    data['doctorNumber'] = this.doctorNumber;
    data['aboutClinic'] = this.aboutClinic;
    data['aboutDoctor'] = this.aboutDoctor;
    data['serviceUid'] = this.serviceUid;
    return data;
  }
}

class AdminDetails {
  String name;
  String number;
  String imagefile;
  String designation;

  AdminDetails({this.name, this.designation, this.number, this.imagefile});

  AdminDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    imagefile = json['imagefile'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['imagefile'] = this.imagefile;
    data['designation'] = this.designation;
    return data;
  }
}

class DoctorDetails {
  String name;
  String number;
  String imagefile;
  String specialization;
  String yearsOfExperience;
  String aboutDoctor;
  String workingDays;

  DoctorDetails(
      {this.name,
      this.specialization,
      this.workingDays = "",
      this.aboutDoctor,
      this.yearsOfExperience,
      this.number,
      this.imagefile});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    imagefile = json['imagefile'];
    specialization = json['specialization'];
    aboutDoctor = json['aboutDoctor'];
    yearsOfExperience = json['yearsOfExperience'];
    workingDays = json['workingDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['imagefile'] = this.imagefile;
    data['specialization'] = this.specialization;
    data['aboutDoctor'] = this.aboutDoctor;
    data['yearsOfExperience'] = this.yearsOfExperience;
    data['workingDays'] = this.workingDays;
    return data;
  }
}
