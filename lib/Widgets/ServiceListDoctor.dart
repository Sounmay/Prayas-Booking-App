import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Screens/IndividualDoctorPage.dart';
import 'package:marquee/marquee.dart';
import 'package:marquee_text/marquee_text.dart';

class ServiceListDoctor extends StatelessWidget {
  final DoctorDetails service;
  final ClinicLocationAndDoctor clinicDetails;
  final String location;
  ServiceListDoctor({this.service, this.location, this.clinicDetails});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => IndividualDoctorPage(
                doctorDetail: service,
                clinicLocationAndDoctor: clinicDetails)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.yellow)),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xff0F2735),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 130,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          service.imagefile,
                        ),
                      ),
                      Text(service.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          textAlign: TextAlign.center),
                      Text(
                        "Speciality in " + service.specialization,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff00A676),
                            fontWeight: FontWeight.w400,
                            fontSize: 9),
                      )
                    ]),
              ),
            ),
            Flexible(
              flex: 11,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: MarqueeText(
                                      speed: 5,
                                      text: location,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                )
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(service.clinicName,
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold, fontSize: 16)),
                              Text('\u{2B50} 4.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ]),
                    Divider(
                      thickness: 2,
                      color: Colors.black87,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            CupertinoIcons.clock,
                            color: Color(0xff5D5FEF),
                          ),
                          Text('Visiting hour', style: TextStyle(fontSize: 12)),
                        ]),
                        Text(service.slots[0].fromHr,
                            style: TextStyle(
                                color: Color(0xff00A676), fontSize: 12))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.wb_sunny,
                            color: Color(0xff5D5FEF),
                          ),
                          Text('Days', style: TextStyle(fontSize: 12))
                        ]),
                        Text('MON-THU',
                            style: TextStyle(
                                color: Color(0xff00A676), fontSize: 12))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
