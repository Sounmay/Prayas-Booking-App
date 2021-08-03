import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/database.dart';
import 'package:freelance_booking_app/Screens/PaymentScreen.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

class SlotBooking extends StatefulWidget {
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  final _db = DatabaseService();

  String userId = '${FirebaseAuth.instance.currentUser.uid}';

  int slt = 15;
  String sl;
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
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final id = args['id'];
    List<ParlourSlotDetails> slots = args['slots'];
    final service = Provider.of<CartService>(context).services[id];
    final servic = Provider.of<CartService>(context); //.services[id];
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
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                      servic.updateDay(id, _selectedDay);
                      print(service);
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0)),
                      todayDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(color: Color(0xff5D5FEF)),
                          borderRadius: BorderRadius.circular(6.0)),
                      todayTextStyle: TextStyle(color: Colors.black),
                      selectedTextStyle: TextStyle(color: Colors.black),
                      defaultTextStyle: TextStyle(color: Colors.black),
                      selectedDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue[100]),
                          borderRadius: BorderRadius.circular(6.0)),
                      withinRangeDecoration: BoxDecoration(color: Colors.white),
                    ),
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
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    children: [
                      ...List.generate(slots.length, (index) {
                        final firstIndex = slots[0];
                        final _timeslot =
                            "${firstIndex.fromHr}:${firstIndex.fromMin}AM - ${firstIndex.toHr}:${firstIndex.toMin} PM";
                        return FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            setState(() {
                              if (_selectedDay == DateTime.utc(1989))
                                a7 = true;
                              else
                                a7 = !a7;
                              if (a7 == false) {
                                a1 = a2 = a3 = a4 = a5 = a6 = a8 = true;
                                sl = _timeslot;
                              }
                            });
                            servic.updateTimeSlot(id, _timeslot);
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
                                      Text(_timeslot,
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
                                      (Text(_timeslot,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0))),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                                color: Color(0xff00A676),
                                                fontSize: 12.0),
                                          ),
                                        ),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
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
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            TextButton(
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(
//                                    horizontal: 20.0),
//                                child: Text(
//                                  'Slot booking',
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                              ),
//                              style: TextButton.styleFrom(
//                                backgroundColor: Color(0xFF0F2735),
//                                shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.circular(5)),
//                              ),
//                              onPressed: () {
//                                Navigator.pushNamed(context, '/slotBooking',
//                                    arguments: {'id': id});
//                              },
//                            ),
//                            SizedBox(
//                              width: 10.0,
//                            ),
//                            TextButton(
//                              child: Text(
//                                'Emergency booking',
//                                style: TextStyle(color: Colors.white),
//                              ),
//                              style: TextButton.styleFrom(
//                                backgroundColor: Color(0xff5D5FEF),
//                                shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.circular(5)),
//                              ),
//                              onPressed: () {},
//                            )
//                          ],
//                        )
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
                        onPressed: () async {
//                           addbook(_selectedDay, sl, userId);
                          // Navigator.pushNamed(context, '/paymentScreen',
                          //     arguments: {
                          //       'id': id,
                          //       'total': service.subtotal + gst1 + gst2
                          //     });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                    cart: service, id: id.toString())),
                          );
//                           developer.log(service.toJson()));
                          // _db.addBookingofCustomer(service, id);
                          // _db.addCustomerBookingToServiceProvider(service, id);
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
