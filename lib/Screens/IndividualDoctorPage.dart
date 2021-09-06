import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Screens/DoctorBookinAppointmentpage.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';

class IndividualDoctorPage extends StatelessWidget {
  final DoctorDetails doctorDetail;
  final ClinicLocationAndDoctor clinicLocationAndDoctor;
  const IndividualDoctorPage(
      {Key key, this.doctorDetail, this.clinicLocationAndDoctor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color(0xff0F2735)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  doctorDetail?.imagefile,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(doctorDetail.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25)),
                              SizedBox(height: 15.0),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Color(0xffC4C4C4).withOpacity(0.2),
                                      border:
                                          Border.all(color: Color(0xff5D5FEF)),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                    child: Text(
                                      doctorDetail.specialization,
                                      style:
                                          TextStyle(color: Color(0xff00E7A4)),
                                    ),
                                  )),
                              SizedBox(height: 5),
                              Text(
                                'Experience',
                                style: TextStyle(color: Color(0xffFFC700)),
                              ),
                              Text(
                                '${doctorDetail.yearsOfExperience}+ years',
                                style: TextStyle(color: Color(0xffFFFFFF)),
                              ),
                            ]),
                          ),
                          Flexible(flex: 1, child: Container(child: Text('')))
                        ]),
                  ),
                ],
              )),
          SizedBox(height: 10),
          Text('About', style: TextStyle(decoration: TextDecoration.underline)),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: clinicLocationAndDoctor.clinicImage,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.36,
                  placeholder: (context, url) => new SizedBox(
                    height: 200,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Icon(Icons.image, size: 40),
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Container(
                                color: Colors.grey[200].withOpacity(0.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      new Image.asset('assets/parlourTile.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20,
                            child: Marquee(
                                blankSpace: 20,
                                velocity: 20,
                                text: clinicLocationAndDoctor.address,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                  ),
                  Text(clinicLocationAndDoctor.clinicName,
                      style: TextStyle(fontSize: 20)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Wrap(children: [
                      Text(clinicLocationAndDoctor.aboutClinic,
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ]),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.yellow)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            // height: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(
                        CupertinoIcons.time,
                        color: Color(0xff5D5FEF),
                        size: 20,
                      ),
                      Text(
                        'Visiting hour',
                        style: TextStyle(fontSize: 12),
                      )
                    ]),
                    Text("10:00 AM - 05:00 PM",
                        style:
                            TextStyle(color: Color(0xff00A676), fontSize: 12))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(
                        CupertinoIcons.sun_min,
                        color: Color(0xff5D5FEF),
                        size: 23,
                      ),
                      Text(
                        'Days',
                        style: TextStyle(fontSize: 12),
                      )
                    ]),
                    Text(
                        doctorDetail.workingDays == ""
                            ? "Mon-Thu"
                            : doctorDetail.workingDays,
                        style:
                            TextStyle(color: Color(0xff00A676), fontSize: 12))
                  ],
                ),
              ],
            ),
          ),
          Text('Covid Safety Measures', style: TextStyle(fontSize: 15)),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
                color: Color(0xFFF6FCFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffCFEFFF))),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.masks_outlined, color: Colors.blue),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Masks required')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.library_add_check, color: Colors.blue),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Appointment required')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(CupertinoIcons.building_2_fill, color: Colors.blue),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Proper sanitised clinic')
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorBookingAppointmentPage(
                              clinicLocationAndDoctor: clinicLocationAndDoctor,
                              doctorDetail: doctorDetail,
                            )));
              },
              style: TextButton.styleFrom(backgroundColor: Color(0xFF5D5FEF)),
              child: Text('Book an appointment',
                  style: TextStyle(color: Colors.white)))
        ]),
      ),
    ));
  }
}
