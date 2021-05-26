import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceListSalon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF0F2735),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.yellow)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Image.asset(
              'assets/Rectangle67.png',
              width: 113,
              height: 130,
            ),
          ),
          Flexible(
            flex: 11,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(
                      CupertinoIcons.location,
                      color: Color(0xFF00E7A4),
                    ),
                    Text('Sec 19, near library',
                        style: TextStyle(
                            color: Color(0xFF00E7A4),
                            fontSize: 15,
                            fontWeight: FontWeight.w400))
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Icon(CupertinoIcons.scissors, color: Colors.white),
                      Text('Perfect Salon',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Text('\u{2B50} 4.0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white))
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          CupertinoIcons.clock,
                          color: Color(0xff5D5FEF),
                        ),
                        Text(
                          'Visiting hour',
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                      Text('10:00 AM - 5:00PM',
                          style: TextStyle(color: Colors.white))
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
                        Text(
                          'Days',
                          style: TextStyle(color: Colors.white),
                        )
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
    );
  }
}
