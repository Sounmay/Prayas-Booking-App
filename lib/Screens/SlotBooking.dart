import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Cart.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/database.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:freelance_booking_app/Screens/PaymentScreen.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

class SlotBooking extends StatefulWidget {
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  final _db = DatabaseService();

  String userId = '${FirebaseAuth.instance.currentUser.uid}';

  String sl;
  bool dateSelected = false;
  bool slotSelected = false;
  bool changeDate = false;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.utc(1989);
  CalendarFormat _calendarFormat = CalendarFormat.week;
  int intervalDuration = 0;
  int slotDuration = 60;
  int count = 0, tempCount = 0;

  int slotIndexSelected = -1;

  bool isChecked = false;
  String _selectedDateForKey = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    //final int employeeNumbers = args['employeeNumbers'];
    /*print(employeeNumbers);*/

    final id = args['id'];
    final type = args['type'];
    final shopName = args['shopName'];
    final List<dynamic> slotsArray = args['slotsArray'];
    final address = args['address'];
    List<Parlour> parlours;
    List<Salon> salons;
    Parlour selectedParlour;
    Salon selectedSalon;
    if (type == "parlour") {
      parlours = Provider.of<List<Parlour>>(context);
      selectedParlour = parlours?.firstWhere((element) {
        if (element == null)
          return false;
        else
          return element?.id == id;
      });
    } else {
      salons = Provider.of<List<Salon>>(context);
      selectedSalon = salons.firstWhere((element) => element.id == id);
    }
    // final bookedSlotsPerDay = args['bookedSlotsPerDay'];
    final bookedSlotsPerDay = type == "parlour"
        ? selectedParlour?.bookedSlotsPerDay ?? null
        : selectedSalon?.bookedSlotsPerDay ?? null;
    List<ParlourSlotDetails> slots = args['slots'];
    final service = Provider.of<CartService>(context).services[id];
    final servic = Provider.of<CartService>(context); //.services[id];
    final gst1 = service != null ? service.subtotal * 0.08 ?? 0.0 : 0.0;
    final gst2 = service != null ? service.subtotal * 0.08 ?? 0.0 : 0.0;
    final time = service != null ? service.time : 0;
    final int minute = time % 60;
    final int hours = (time / 60).floor();
    // double paymentValue = service.subtotal.toDouble() + gst1 + gst2;

    final navigator = Provider.of<NavigationProvider>(context);

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
                              shopName,
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
                        dateSelected = true;
                        if (_selectedDay == DateTime.utc(1989) ||
                            _selectedDay != selectedDay) changeDate = true;
                        _selectedDay = selectedDay;
                        _selectedDateForKey =
                            "${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year - 2000}";
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
                          color: Colors.transparent,
                          border: Border.all(color: Colors.transparent),
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
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Select your slot ',
                    style: TextStyle(color: Colors.black, fontSize: 17.0),
                    textAlign: TextAlign.right,
                  ),
                ),
                if (dateSelected)
                  bookedSlotsPerDay[_selectedDateForKey] == null
                      ? Container(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 10),
                          height: slotsArray.length % 2 == 0
                              ? slotsArray.length.toDouble() * 29.0
                              : slotsArray.length.toDouble() * 29.0 + 29.0,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: slotsArray?.length ?? 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: width * 0.4 / 40,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (slotsArray[index]['emp'] > 0) {
                                      slotIndexSelected = index;
                                      servic.updateTimeSlot(
                                          id, slotsArray[index]['time'] ?? "");
                                      slotSelected = true;
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: slotIndexSelected != index
                                              ? Colors.blue
                                              : Colors.white),
                                      borderRadius: BorderRadius.circular(6),
                                      color: slotIndexSelected == index
                                          ? Color(0xff00A676)
                                          : Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      (Text(slotsArray[index]['time'] ?? "",
                                          style: TextStyle(
                                              color: slotIndexSelected == index
                                                  ? Colors.white
                                                  : Color(0xff5D5FEF),
                                              fontSize: 12.0))),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${slotsArray[index]['emp']}',
                                            style: TextStyle(
                                                color:
                                                    slotIndexSelected == index
                                                        ? Color(0xff00A676)
                                                        : Colors.white,
                                                fontSize: 12.0),
                                          ),
                                        ),
                                        color: slotIndexSelected == index
                                            ? Colors.white
                                            : Color(0xff00A676),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 10),
                          height:
                              bookedSlotsPerDay[_selectedDateForKey].length %
                                          2 ==
                                      0
                                  ? bookedSlotsPerDay[_selectedDateForKey]
                                          .length
                                          .toDouble() *
                                      29.0
                                  : bookedSlotsPerDay[_selectedDateForKey]
                                              .length
                                              .toDouble() *
                                          29.0 +
                                      29.0,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: bookedSlotsPerDay[_selectedDateForKey]
                                    ?.length ??
                                0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: width * 0.4 / 40,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (bookedSlotsPerDay[_selectedDateForKey]
                                            [index]['emp'] >
                                        0) {
                                      slotIndexSelected = index;
                                      servic.updateTimeSlot(
                                          id,
                                          bookedSlotsPerDay[_selectedDateForKey]
                                                  [index]['time'] ??
                                              "");
                                      slotSelected = true;
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: slotIndexSelected != index
                                              ? Colors.blue
                                              : Colors.white),
                                      borderRadius: BorderRadius.circular(6),
                                      color: slotIndexSelected == index
                                          ? Color(0xff00A676)
                                          : Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      (Text(
                                          bookedSlotsPerDay[_selectedDateForKey]
                                                  [index]['time'] ??
                                              "",
                                          style: TextStyle(
                                              color: slotIndexSelected == index
                                                  ? Colors.white
                                                  : Color(0xff5D5FEF),
                                              fontSize: 12.0))),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${bookedSlotsPerDay[_selectedDateForKey][index]['emp']}',
                                            style: TextStyle(
                                                color:
                                                    slotIndexSelected == index
                                                        ? Color(0xff00A676)
                                                        : Colors.white,
                                                fontSize: 12.0),
                                          ),
                                        ),
                                        color: slotIndexSelected == index
                                            ? Colors.white
                                            : Color(0xff00A676),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
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
                            Text("Net Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500)),
                            Text(
                                service != null && service.subtotal != null
                                    ? "₹ ${(service?.subtotal ?? 0 + gst1 + gst2).toStringAsFixed(2)}/-"
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
                            Text(
                                "For ${service?.serviceName?.length ?? "0"} services",
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
                      ]),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Color(0xff5D5FEF),
                        value: isChecked,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Pay by cash after service is over.')
                    ],
                  ),
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
                                'Confirm your booking    ',
                                style: TextStyle(
                                    color: (isChecked == true)
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  color: (isChecked == true)
                                      ? Colors.white
                                      : Colors.grey,
                                  size: 15.0)
                            ],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: (isChecked == true)
                              ? Color(0xff5D5FEF)
                              : Colors.black45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () async {
                          if (dateSelected == true &&
                              slotSelected == true &&
                              isChecked == true) {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => PaymentScreen(
//                                      total: double.parse(
//                                          paymentValue.toStringAsFixed(2)),
//                                      cart: service,
//                                      id: id.toString())),
                            String otp = randomAlphaNumeric(6);
                            // final cart = Provider.of<CartService>(context);
                            service.addOtp(otp);
                            service.addGST(service.subtotal.toInt());
                            _db.addBookingofCustomer(service, id.toString());
                            _db.addCustomerBookingToServiceProvider(
                                service, id.toString());

                            if (bookedSlotsPerDay == null) {
                              DatabaseService()
                                  .upgradeParlourAndSalonBookedSlotsDatabaseFirst(
                                      id,
                                      slotIndexSelected,
                                      slotsArray,
                                      _selectedDateForKey,
                                      type == "parlour" ? true : false);
                            } else {
                              DatabaseService()
                                  .upgradeParlourAndSalonBookedSlotsDatabaseExisting(
                                      id,
                                      slotIndexSelected,
                                      bookedSlotsPerDay,
                                      slotsArray,
                                      _selectedDateForKey,
                                      type == "parlour" ? true : false);
                            }
                            navigator.changeWidgetIndex(1);

                            Navigator.of(context)
                                .popUntil(ModalRoute.withName("/wrapper"));
                          } else if (isChecked == false) {
                            Fluttertoast.showToast(
                                msg: 'Please select the checkbox',
                                backgroundColor: Color(0xff5D5FEF),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG);
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                    'Please select a date and slot for booking',
                                backgroundColor: Color(0xff5D5FEF),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG);
                          }
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
