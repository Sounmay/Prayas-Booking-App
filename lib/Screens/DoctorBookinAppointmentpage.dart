import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Screens/DoctorSlotBooking.dart';
import 'package:freelance_booking_app/Widgets/LowerTotalService.dart';
import 'package:freelance_booking_app/Widgets/UpperCardDoctorBooking.dart';
import 'package:provider/provider.dart';

class DoctorBookingAppointmentPage extends StatefulWidget {
  final DoctorDetails doctorDetail;
  final ClinicLocationAndDoctor clinicLocationAndDoctor;
  const DoctorBookingAppointmentPage(
      {Key key, this.doctorDetail, this.clinicLocationAndDoctor})
      : super(key: key);

  @override
  _DoctorBookingAppointmentPageState createState() =>
      _DoctorBookingAppointmentPageState();
}

class _DoctorBookingAppointmentPageState
    extends State<DoctorBookingAppointmentPage> {
  _onSlotBookint() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DoctorSlotBooking(
              clinicLocationAndDoctor: widget.clinicLocationAndDoctor,
              doctorDetail: widget.doctorDetail,
            )));
  }

  bool serviceAdded = false; // service added or not

  String userName = '';

  _loadData() async {
    final data = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    userName = data['name'];
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);
    final service = Provider.of<CartService>(context).services;
    final id =
        widget.clinicLocationAndDoctor.serviceUid + widget.doctorDetail.name;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book your appointment'),
        backgroundColor: Color(0xFF0F2735),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperCardDoctorBooking(
                clinic: widget?.clinicLocationAndDoctor,
                doctor: widget?.doctorDetail,
                context: context),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Container(
                  height: height * 0.05,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most availed services",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              cart.removeAllServices(id);
                            },
                            child: Text(
                              "Clear",
                              style: TextStyle(color: Colors.grey),
                            ))
                      ]),
                )),
            Container(
                height: height * 0.26,
                child: ListView.builder(
                    itemCount: widget.doctorDetail.serviceList.length,
                    itemBuilder: (ctx, i) {
                      int hr =
                          int.parse(widget.doctorDetail.serviceList[i]?.hour) ??
                              0;
                      int min = int.parse(
                              widget.doctorDetail.serviceList[i]?.minute) ??
                          0;
                      return Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                height: 30,
                                width: 2.3,
                                color: Color(0xff5D5FEF),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // mostAvailed[i].name,
                                    widget?.doctorDetail?.serviceList[i]
                                            ?.name ??
                                        "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "₹ " +
                                        "${widget.doctorDetail.serviceList[i].price}" +
                                        " | " +
                                        "${hr * 60 + min} Min",
                                    // "₹ 40",
                                    style: TextStyle(color: Color(0xFF606572)),
                                  )
                                ],
                              ),
                            ]),
                            service[id] != null &&
                                    service[id].serviceName.contains(
                                        widget.doctorDetail.serviceList[i].name)
                                // .contains(mostAvailed[i].name)
                                ? SizedBox(
                                    height: 30,
                                    width: 60,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xff02CF96),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Added",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                : SizedBox(
                                    height: 30,
                                    width: 50,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xff5D5FEF),
                                        ),
                                        onPressed: () {
                                          cart.addServices(
                                              id,
                                              widget.doctorDetail.serviceList[i]
                                                  .name,
                                              int.parse(widget.doctorDetail
                                                  .serviceList[i].price),
                                              hr * 60 + min,
                                              widget.clinicLocationAndDoctor
                                                  .clinicName,
                                              userName,
                                              widget.clinicLocationAndDoctor
                                                  .address);
                                          serviceAdded = true;
                                          // print(widget.clinicLocationAndDoctor
                                          //     .serviceUid);
                                        },
                                        child: Text(
                                          "Add",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
      bottomNavigationBar: LowerCardServiceTotal(
        id: id,
        onSlotBooking: _onSlotBookint,
      ),
    );
  }
}
