import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class ServiceListParlour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.yellow)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Image.asset(
              'assets/Group 30.png',
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
                      color: Colors.green,
                    ),
                    Text('Sec 19, near library',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w400))
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shri Parlor',
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
    );
  }
}
