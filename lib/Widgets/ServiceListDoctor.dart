import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ServiceListDoctor extends StatelessWidget {
  final service;
  ServiceListDoctor({this.service});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/serviceDetailsMedical',
          arguments: {
            'details': service
          }
        );
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
                width: 120,
                height: 130,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        service.image,
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        service.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        "Speciality in " + service.speciality,
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        CupertinoIcons.location,
                        color: Colors.green,
                      ),
                      Text(service.location,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w400))
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(service.clinicName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('\u{2B50} 4.0',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                      ],
                    ),
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
                          Text('Visiting hour')
                        ]),
                        Text('10:00 AM - 5:00PM',
                            style: TextStyle(color: Color(0xff00A676)))
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
                          Text('Days')
                        ]),
                        Text('MON-THU',
                            style: TextStyle(color: Color(0xff00A676)))
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
