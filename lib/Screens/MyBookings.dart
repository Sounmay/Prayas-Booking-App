import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freelance_booking_app/Models/Bookings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:date_format/date_format.dart';

class MyBooking extends StatefulWidget {
  MyBooking({Key key}) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  bool b1 = true,
      c1 = true,
      c2 = true,
      c3 = true,
      c4 = true,
      c5 = true,
      c6 = true,
      c7 = true;

  String date2;

  static final formKey = GlobalKey<FormState>();
  bool isLoading = true;
  bool firstLoad = true;
  List<BookingsDetails> bookingDetails;

  Future _loadDatafromFirestore(String uid) async {
    try {
      final data =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      setState(() {
        final ds = data.data()['bookings'];
        print(ds);

        bookingDetails = List.from(
            data.data()['bookings'].map((e) => BookingsDetails.fromJson(e)));

        isLoading = false;
        firstLoad = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  String otp = randomAlphaNumeric(6);
  String userId = '${FirebaseAuth.instance.currentUser.uid}';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      _loadDatafromFirestore(userId);
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LocationNameWidget(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    height: 70,
                    child: TextFormField(
                        key: formKey,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: new Icon(Icons.search),
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Search for a service',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(6))),
                        onChanged: (val) {}),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My bookings',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF0F2735)),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: b1 ? Colors.white : Color(0xFF5D5FEF)),
                              child: Icon(Icons.filter_alt_outlined,
                                  size: 30,
                                  color:
                                      b1 ? Color(0xFF5D5FEF) : Colors.white)),
                          onPressed: () {
                            setState(() {
                              b1 = !b1;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  b1
                      ? isLoading == true
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [CircularProgressIndicator()],
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.26,
                              child: ListView.builder(
                                  itemCount: bookingDetails.length,
                                  itemBuilder: (ctx, i) {
                                    DateTime date1 =
                                        bookingDetails[i].date.toDate();
                                    date2 = formatDate(
                                        date1, [d, ' ', MM, ', ', DD]);
                                    return Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/invi');
                                            },
                                            child: Container(
                                                child: Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 4,
                                                  color: Color(0xFF3AD48A),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'OTP : ${bookingDetails[i].otp}',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF5D5FEF)),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(date2,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF5D5FEF))),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xFF5D5FEF)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: (Text(
                                                                '${bookingDetails[i].timeslot}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12.0))),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Perfect Salon',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      20)),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            decoration: BoxDecoration(
                                                                color: Color(bookingDetails[
                                                                            i]
                                                                        .isApproved
                                                                    ? 0xFF3AD48A
                                                                    : 0xff545454),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20),
                                                                Text('  Booked',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                      //next element
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            shadowColor: Colors.grey,
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('Service',
                                          style: TextStyle(
                                              color: Color(0xFF0F2735))),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            c1 = c2 =
                                                c3 = c4 = c5 = c6 = c7 = true;
                                          });
                                        },
                                        child: Text(
                                          'Clear',
                                          style: TextStyle(
                                              color: Color(0xFFB6BECB)),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c1 = !c1;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c1
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Doctor',
                                              style: TextStyle(
                                                  color: c1
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c2 = !c2;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c2
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Parlour',
                                              style: TextStyle(
                                                  color: c2
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c3 = !c3;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c3
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Salon',
                                              style: TextStyle(
                                                  color: c3
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Status',
                                    style: TextStyle(color: Color(0xFF0F2735)),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c4 = !c4;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c4
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Booked',
                                              style: TextStyle(
                                                  color: c4
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c5 = !c5;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c5
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Scheduled',
                                              style: TextStyle(
                                                  color: c5
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c6 = !c6;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c6
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Failed',
                                              style: TextStyle(
                                                  color: c6
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            c7 = !c7;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: c7
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Refund',
                                              style: TextStyle(
                                                  color: c7
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          b1 = true;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF5D5FEF),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: (Text('Apply Filter',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.0))),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
