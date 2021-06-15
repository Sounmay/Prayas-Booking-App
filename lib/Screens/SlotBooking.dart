import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class SlotBooking extends StatefulWidget {
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  int slt = 15;
  bool a1 = true,
      a2 = true,
      a3 = true,
      a4 = true,
      a5 = true,
      a6 = true,
      a7 = true,
      a8 = true;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.utc(1989);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final id = args['id'];
    final service = Provider.of<CartService>(context).services[id];
    final gst1 = service != null ? service.subtotal * 0.08 ?? 0 : 0;
    final gst2 = service != null ? service.subtotal * 0.08 ?? 0 : 0;
    final time = service != null ? service.time : 0;
    final int minute = time % 60;
    final int hours = (time / 60).floor();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF0F2735),
            title: Row(
              children: [
                Text('Slot Booking',
                    style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
              ],
            )),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/Rectangle67.png',
                        height: 110,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10.0, 70.0, 0.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.scissors,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Perfect Salon',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'This week',
                        style: TextStyle(color: Colors.black, fontSize: 17.0),
                        textAlign: TextAlign.right,
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xff5D5FEF),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xFFFAFAFA),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    calendarFormat: CalendarFormat.week,
                    calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xff5D5FEF)),
                            borderRadius: BorderRadius.circular(6.0)),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayDecoration:
                            BoxDecoration(color: Color(0xFFFAFAFA)),
                        todayTextStyle: TextStyle(color: Colors.black),
                        withinRangeDecoration:
                            BoxDecoration(color: Colors.white)),
                    headerVisible: false,
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Select your slot ',
                    style: TextStyle(color: Colors.black, fontSize: 17.0),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a1 = true;
                          else
                            a1 = !a1;
                          if (a1 == false)
                            a8 = a2 = a3 = a4 = a5 = a6 = a7 = true;
                        });
                      },
                      child: a1
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('10:00 AM - 11:00 AM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('10:00 AM - 11:00 AM ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(width: 15.0),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a2 = true;
                          else
                            a2 = !a2;
                          if (a2 == false)
                            a1 = a8 = a3 = a4 = a5 = a6 = a7 = true;
                        });
                      },
                      child: a2
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('11:00 AM - 12:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('11:00 AM - 12:00 PM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a3 = true;
                          else
                            a3 = !a3;
                          if (a3 == false)
                            a1 = a2 = a8 = a4 = a5 = a6 = a7 = true;
                        });
                      },
                      child: a3
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('12:00 PM - 01:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('12:00 PM - 01:00 PM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(width: 15.0),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a4 = true;
                          else
                            a4 = !a4;
                          if (a4 == false)
                            a1 = a2 = a3 = a8 = a5 = a6 = a7 = true;
                        });
                      },
                      child: a4
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('02:00 PM - 03:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('02:00 PM - 03:00 PM ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a5 = true;
                          else
                            a5 = !a5;
                          if (a5 == false)
                            a1 = a2 = a3 = a4 = a8 = a6 = a7 = true;
                        });
                      },
                      child: a5
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('03:00 PM - 04:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('03:00 PM - 04:00 PM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(width: 15.0),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a6 = true;
                          else
                            a6 = !a6;
                          if (a6 == false)
                            a1 = a2 = a3 = a4 = a5 = a8 = a7 = true;
                        });
                      },
                      child: a6
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('04:00 PM - 05:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('04:00 PM - 05:00 PM ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a7 = true;
                          else
                            a7 = !a7;
                          if (a7 == false)
                            a1 = a2 = a3 = a4 = a5 = a6 = a8 = true;
                        });
                      },
                      child: a7
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('05:00 PM - 06:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('05:00 PM - 06:00 PM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(width: 15.0),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        setState(() {
                          if (_selectedDay == DateTime.utc(1989))
                            a8 = true;
                          else
                            a8 = !a8;
                          if (a8 == false)
                            a1 = a2 = a3 = a4 = a5 = a6 = a7 = true;
                        });
                      },
                      child: a8
                          ? Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: (Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('06:00 PM - 07:00 PM ',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12.0)),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    color: Color(0xff00A676),
                                  )
                                ],
                              )),
                            )
                          : Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xff00A676)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (Text('06:00 PM - 07:00 PM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0))),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: height * 0.28,
                  color: Color(0xFFF7F7F7),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal Amount",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                )),
                            Text(service != null ? "${service.subtotal}" : "0",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("GST 1 ( 8% )",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                )),
                            Text(service != null ? "$gst1" : "0",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("GST 2 ( 8% )",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                )),
                            Text(
                                service != null && service.subtotal != null
                                    ? "$gst2"
                                    : "0",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500)),
                            Text(
                                service != null && service.subtotal != null
                                    ? "₹ ${service.subtotal + gst1 + gst2}/-"
                                    : "0",
                                style: TextStyle(
                                    color: Color(0xff5D5FEF),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("For 3 services",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                            Row(children: [
                              Text("Duration : ",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  service != null && service.time != null
                                      ? "$hours hr $minute min"
                                      : "0",
                                  style: TextStyle(
                                      color: Color(0xff5D5FEF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                            ])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'Slot booking',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF0F2735),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/slotBooking',
                                    arguments: {'id': id});
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            TextButton(
                              child: Text(
                                'Emergency booking',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xff5D5FEF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onPressed: () {},
                            )
                          ],
                        )
                      ]),
                ),
                Container(
                  color: Color(0xFFFAFAFA),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Proceed    ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.white, size: 15.0)
                            ],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff5D5FEF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () {
                            Navigator.pushNamed(context, '/paymentScreen',
                            arguments: {'id':id,'total':service.subtotal + gst1 + gst2});
                          },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
