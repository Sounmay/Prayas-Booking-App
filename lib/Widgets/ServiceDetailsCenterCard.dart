import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceCardDetailsCenterCard extends StatelessWidget {
  final service;
  ServiceCardDetailsCenterCard(this.service);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.yellow),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Image.asset(
              'assets/Rectangle.png',
              width: 113,
              height: 130,
            ),
          ),
          Flexible(
            flex: 11,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(service.clinicName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff5D5FEF)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text('\u{2B50} 4.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black87,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.av_timer,
                            color: Color(0xff5D5FEF),
                          ),
                          Text('Visiting hour')
                        ]),
                        Text('10:00 AM - 5:00PM',
                            style: TextStyle(color: Color(0xff00A676)))
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
