import 'dart:ui';
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

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);
    final service = Provider.of<CartService>(context).services;
    final id = widget.clinicLocationAndDoctor.serviceUid;
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
                      ]),
                )),
            Container(
                height: height * 0.26,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (ctx, i) {
                      // int hr = int.parse(mostAvailed[i]?.hour) ?? 0;
                      // int min = int.parse(mostAvailed[i]?.minute) ?? 0;
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
                                    "dfd",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    // "₹ " +
                                    //     "${mostAvailed[i].price}" +
                                    //     " | " +
                                    //     "${mostAvailed[i].hour} Hr ${mostAvailed[i].minute} Min",
                                    "₹ 40",
                                    style: TextStyle(color: Color(0xFF606572)),
                                  )
                                ],
                              ),
                            ]),
                            service[id] != null &&
                                    service[id].serviceName.contains("df")
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
                                          // cart.addServices(
                                          //     id,
                                          //     mostAvailed[i].name,
                                          //     int.parse(
                                          //         mostAvailed[i].price),
                                          //     hr * 60 + min,
                                          //     shopName,
                                          //     userName);
                                          // serviceAdded = true;
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
        id: widget.clinicLocationAndDoctor.serviceUid,
        onSlotBooking: _onSlotBookint,
      ),
    );
  }
}
