import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app/Models/Cart.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';

class DividedSlots {
  int emp;
  String time;

  DividedSlots({this.emp, this.time});

  DividedSlots.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    emp = json['emp'];
  }

  Map<String, dynamic> toJson() => {
        "time": time,
        "emp": emp,
      };
  Map<String, dynamic> toJsonClinic() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['emp'] = this.emp;
    return data;
  }
}

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future upgradeParlourSlotsDatabase(var id, bool isParlour) async {
    var ref = isParlour
        ? _db.collection('ParlourServices')
        : _db.collection('SalonServices');

    List<DividedSlots> dividedSlots = [];

    var temp, temp2;
    try {
      await ref.doc('$id').get().then((value) {
        temp = value['slotList'][0];
        temp2 = value['details']['numOfEmployees'];
      });
      print(temp);
      for (int i = int.parse(temp['fromHr']);
          i < int.parse(temp['toHr']);
          i++) {
        var startingTime, startingSuffix, endingTime, endingSuffix;
        if (i > 12) {
          startingSuffix = 'PM';
          endingSuffix = 'PM';
          startingTime = '${i - 12}:${temp['fromMin']} $startingSuffix';
          endingTime = (i - 12 + 1) > 12
              ? '${i - 12 + 1 - 12}:${temp['fromMin']} $endingSuffix'
              : '${i - 12 + 1}:${temp['fromMin']} $endingSuffix';
        } else {
          startingSuffix = i == 12 ? 'PM' : 'AM';
          endingSuffix = (i + 1) >= 12 ? 'PM' : 'AM';
          startingTime = '$i:${temp['fromMin']} $startingSuffix';
          endingTime = (i + 1) > 12
              ? '${i + 1 - 12}:${temp['fromMin']} $endingSuffix'
              : '${i + 1}:${temp['fromMin']} $endingSuffix';
        }
        DividedSlots tempSlot = DividedSlots(
            time: '$startingTime - $endingTime', emp: int.parse(temp2));
        dividedSlots.add(tempSlot);
      }
    } catch (e) {
      print(e.toString());
    }

    ref.doc('$id').update({
      "slots":
          FieldValue.arrayUnion(dividedSlots.map((e) => e.toJson()).toList())
    });
  }

  Future upgradeMedicalSlotsDatabase(var id) async {
    var ref = _db.collection('MedicalServices');

    List<DividedSlots> dividedSlots = [];

    var temp, temp2;
    try {
      await ref.doc('$id').get().then((value) {
        temp = value['slotList'][0];
        temp2 = value['details']['numOfEmployees'];
      });
      print(temp);
      for (int i = int.parse(temp['fromHr']);
          i < int.parse(temp['toHr']);
          i++) {
        var startingTime, startingSuffix, endingTime, endingSuffix;
        if (i > 12) {
          startingSuffix = 'PM';
          endingSuffix = 'PM';
          startingTime = '${i - 12}:${temp['fromMin']} $startingSuffix';
          endingTime = (i - 12 + 1) > 12
              ? '${i - 12 + 1 - 12}:${temp['fromMin']} $endingSuffix'
              : '${i - 12 + 1}:${temp['fromMin']} $endingSuffix';
        } else {
          startingSuffix = i == 12 ? 'PM' : 'AM';
          endingSuffix = (i + 1) >= 12 ? 'PM' : 'AM';
          startingTime = '$i:${temp['fromMin']} $startingSuffix';
          endingTime = (i + 1) > 12
              ? '${i + 1 - 12}:${temp['fromMin']} $endingSuffix'
              : '${i + 1}:${temp['fromMin']} $endingSuffix';
        }
        DividedSlots tempSlot = DividedSlots(
            time: '$startingTime - $endingTime', emp: int.parse(temp2));
        dividedSlots.add(tempSlot);
      }
    } catch (e) {
      print(e.toString());
    }

    ref.doc('$id').update({
      "slots":
          FieldValue.arrayUnion(dividedSlots.map((e) => e.toJson()).toList())
    });
  }

  Future upgradeParlourAndSalonBookedSlotsDatabaseExisting(
      var id,
      int index,
      Map<dynamic, dynamic> bookedSlots,
      List<dynamic> slotArray,
      String mapKey,
      bool isParlour) async {
    var ref = isParlour == true
        ? _db.collection('ParlourServices')
        : _db.collection('SalonServices');

    bookedSlots.putIfAbsent(mapKey, () => slotArray);

    bookedSlots[mapKey][index]['emp'] = bookedSlots[mapKey][index]['emp'] - 1;

    ref.doc('$id').update({"bookedSlotsPerDay": bookedSlots});
  }

  Future upgradeClinicBookedSlotsDatabaseExisting(
      var id,
      int index,
      Map<dynamic, dynamic> bookedSlots,
      List<DividedSlots> slotArray,
      String mapKey,
      DoctorDetails doctorDetails) async {
    var ref = _db.collection('MedicalServices');
    bool contains = bookedSlots.containsKey(mapKey);
    bookedSlots.putIfAbsent(
        mapKey, () => slotArray.map((x) => x.toJson()).toList());

    bookedSlots[mapKey][index]['emp'] = bookedSlots[mapKey][index]['emp'] - 1;
    print(bookedSlots);
    DoctorDetails temp = DoctorDetails(
        name: doctorDetails.name,
        specialization: doctorDetails.name,
        bookedSlotsPerDay: bookedSlots,
        workingDays: doctorDetails.workingDays,
        aboutDoctor: doctorDetails.aboutDoctor,
        dividedSlots: doctorDetails.dividedSlots,
        serviceList: doctorDetails.serviceList,
        slots: doctorDetails.slots,
        yearsOfExperience: doctorDetails.yearsOfExperience,
        number: doctorDetails.number,
        imagefile: doctorDetails.imagefile);

    print(temp.toJson());
    print('dont');

    ref.doc('$id').update({
      "doctorList": FieldValue.arrayUnion([temp.toJson()])
    });
    bookedSlots[mapKey][index]['emp'] = bookedSlots[mapKey][index]['emp'] + 1;
    if (!contains) bookedSlots.remove(mapKey);
    ref.doc('$id').update({
      "doctorList": FieldValue.arrayRemove([doctorDetails.toJsonToRemove()])
    });
    ref.doc('$id').update({
      "doctorList": FieldValue.arrayRemove([doctorDetails.toJson()])
    });
  }

  Future upgradeParlourAndSalonBookedSlotsDatabaseFirst(var id, int index,
      List<dynamic> bookedSlots, String mapKey, bool isParlour) async {
    var ref = isParlour == true
        ? _db.collection('ParlourServices')
        : _db.collection('SalonServices');

    bookedSlots[index]['emp'] = bookedSlots[index]['emp'] - 1;

    Map<String, dynamic> bookedSlotMap = {mapKey: bookedSlots};

    ref.doc('$id').update({"bookedSlotsPerDay": bookedSlotMap});
  }

  Future upgradeClinicBookedSlotsDatabaseFirst(
      var id,
      int index,
      List<DividedSlots> bookedSlots,
      String mapKey,
      DoctorDetails doctorDetails) async {
    var ref = _db.collection('MedicalServices');

    bookedSlots[index].emp = bookedSlots[index].emp - 1;

    Map<String, dynamic> bookedSlotMap = {mapKey: bookedSlots};

    DoctorDetails temp = DoctorDetails(
        name: doctorDetails.name,
        specialization: doctorDetails.name,
        bookedSlotsPerDay: bookedSlotMap,
        workingDays: doctorDetails.workingDays,
        aboutDoctor: doctorDetails.aboutDoctor,
        dividedSlots: doctorDetails.dividedSlots,
        serviceList: doctorDetails.serviceList,
        slots: doctorDetails.slots,
        yearsOfExperience: doctorDetails.yearsOfExperience,
        number: doctorDetails.number,
        imagefile: doctorDetails.imagefile);

    ref.doc('$id').update({
      "doctorList": FieldValue.arrayUnion([temp.toJson()])
    });
    ref.doc('$id').update({
      "doctorList": FieldValue.arrayRemove([doctorDetails.toJson()])
    });
  }

  Stream<List<Medical>> streamMedical() {
    var ref = _db.collection('MedicalServices');

    return ref.snapshots().map((event) => event.docs.map((e) {
          if (e.data()["location"]["status"] == "Accepted")
            return Medical.fromFirestore(e);
        }).toList());
  }

  Stream<List<Parlour>> streamParlour() {
    var ref = _db.collection('ParlourServices');

    return ref.snapshots().map((event) => event.docs.map((e) {
          if (e.data()["location"]["status"] == "Accepted")
            return Parlour.fromFirestore(e);
        }).toList());
  }

  Stream<List<Salon>> streamSalon() {
    var ref = _db.collection('SalonServices');

    return ref.snapshots().map((event) => event.docs.map((e) {
          if (e.data()["location"]["status"] == "Accepted")
            return Salon.fromFirestore(e);
        }).toList());
  }

  Stream<List<Parlour>> streamParlourForSlots() {
    var ref = _db.collection('ParlourServices');

    return ref.snapshots().map((event) => event.docs.map((e) {
          if (e.data()["location"]["status"] == "Accepted")
            return Parlour.fromFirestore(e);
        }).toList());
  }

  Stream<List<Salon>> streamSalonForSlots() {
    var ref = _db.collection('SalonServices');

    return ref.snapshots().map((event) => event.docs.map((e) {
          if (e.data()["location"]["status"] == "Accepted")
            return Salon.fromFirestore(e);
        }).toList());
  }

  Stream<List<Medical>> streamMedicalForSlots() {
    var ref = _db.collection('MedicalServices');

    return ref.snapshots().map((event) => event.docs.map((e) {
          if (e.data()["location"]["status"] == "Accepted")
            return Medical.fromFirestore(e);
        }).toList());
  }

  Future updateServiceProviderInfo(String name, String number) async {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"name": name, "number": number});
  }

  Future changeUserAvatar(String imgUrl) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"image": imgUrl});
  }

  Future addBookingofCustomer(Cart service, String serviceId) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(service.id)
        .update({
      "bookings": FieldValue.arrayUnion([service.toJson(serviceId)])
    });
  }

  Future addCustomerBookingToServiceProvider(Cart service, String uid) async {
    await FirebaseFirestore.instance
        .collection('ServiceProviders')
        .doc(uid)
        .update({
      "event": FieldValue.arrayUnion([service.toJson(uid)])
    });
  }
}
