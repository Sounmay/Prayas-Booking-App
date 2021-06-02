import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SlotBooking extends StatefulWidget {
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  int slt = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  calendarFormat: CalendarFormat.week,
                  calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff5D5FEF)),
                      ),
                      todayDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xff5D5FEF)),
                          borderRadius: BorderRadius.circular(6.0)),
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: FlatButton(
                      padding: EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Text('10:00 AM - 11:00 AM ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12.0)),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                            color: Color(0xff00A676),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
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
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
