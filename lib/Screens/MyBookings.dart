import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  bool filterButton = true,
      doctorFilter = true,
      parlourFilter = true,
      salonFilter = true,
      bookedFilter = true,
      scheduledFilter = true,
      failedFilter = true,
      refundFilter = true;

  String date2;
  int countBooked = 0;
  int countScheduled = 0;

  static final formKey = GlobalKey<FormState>();
  bool isLoading = true;
  bool firstLoad = true;
  List<BookingsDetails> bookingDetails;
  List<BookingsDetails> finalList;
  List<BookingsDetails> bookedList;
  List<BookingsDetails> scheduledList;

  Future _loadDatafromFirestore() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      setState(() {
        final ds = data.data()['bookings'];
        print(ds);

        bookingDetails = List.from(
            data.data()['bookings'].map((e) => BookingsDetails.fromJson(e)));
        finalList = bookingDetails;

        bookedList = bookingDetails.where((i) => i.isApproved).toList();
        scheduledList =
            bookingDetails.where((i) => i.isApproved == false).toList();

        isLoading = false;
        firstLoad = false;
      });
    } catch (e) {
      print(e.toString());
    }
    _refreshController.refreshCompleted();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String otp = randomAlphaNumeric(6);
  // String userId = '${FirebaseAuth.instance.currentUser.uid}';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDatafromFirestore();
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 10.0,
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
                        /*FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: filterButton
                                      ? Colors.white
                                      : Color(0xFF5D5FEF)),
                              child: Icon(Icons.filter_alt_outlined,
                                  size: 30,
                                  color: filterButton
                                      ? Color(0xFF5D5FEF)
                                      : Colors.white)),
                          onPressed: () {
                            setState(() {
                              filterButton = !filterButton;
                            });
                          },
                        )*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  filterButton
                      ? isLoading == true
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [CircularProgressIndicator()],
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: SmartRefresher(
                                controller: _refreshController,
                                enablePullDown: true,
                                enablePullUp: false,
                                header: ClassicHeader(
                                  completeIcon:
                                      Icon(Icons.done, color: Colors.green),
                                  refreshingIcon: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                onRefresh: () {
                                  _loadDatafromFirestore();
                                  finalList = (bookedFilter == true &&
                                          scheduledFilter == false)
                                      ? bookedList
                                      : (bookedFilter == false &&
                                              scheduledFilter == true)
                                          ? scheduledList
                                          : bookingDetails;
                                },
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: finalList.length,
                                    itemBuilder: (ctx, i) {
                                      DateTime date1 =
                                          finalList[i].date.toDate();
                                      date2 = formatDate(
                                          date1, [d, ' ', MM, ', ', DD]);

                                      return Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          children: [
                                            FlatButton(
                                              onPressed: () {
                                                //                                              Navigator.pushNamed(
                                                //                                                  context, '/invi');
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
                                                          'Unique ID : ${finalList[i].otp}',
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
                                                                  EdgeInsets
                                                                      .all(5),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF5D5FEF)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0)),
                                                              child: (Text(
                                                                  '${finalList[i].timeslot}',
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
                                                            Text(
                                                                finalList[i]
                                                                    .shopName,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20)),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              decoration: BoxDecoration(
                                                                  color: Color(finalList[
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
                                                                  finalList[i]
                                                                          .isApproved
                                                                      ? [
                                                                          Icon(
                                                                              Icons.check,
                                                                              color: Colors.white,
                                                                              size: 20),
                                                                          Text(
                                                                              '  Booked',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ))
                                                                        ]
                                                                      : Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 8.0),
                                                                          child: Text(
                                                                              'Scheduled',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              )),
                                                                        )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )),
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
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
                                            doctorFilter = parlourFilter =
                                                salonFilter = bookedFilter =
                                                    scheduledFilter =
                                                        failedFilter =
                                                            refundFilter = true;
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
                                            doctorFilter = !doctorFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: doctorFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Doctor',
                                              style: TextStyle(
                                                  color: doctorFilter
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            parlourFilter = !parlourFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: parlourFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Parlour',
                                              style: TextStyle(
                                                  color: parlourFilter
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            salonFilter = !salonFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: salonFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Salon',
                                              style: TextStyle(
                                                  color: salonFilter
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
                                            bookedFilter = !bookedFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: bookedFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Booked',
                                              style: TextStyle(
                                                  color: bookedFilter
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            scheduledFilter = !scheduledFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: scheduledFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Scheduled',
                                              style: TextStyle(
                                                  color: scheduledFilter
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            failedFilter = !failedFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: failedFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Failed',
                                              style: TextStyle(
                                                  color: failedFilter
                                                      ? Color(0xFF5D5FEF)
                                                      : Colors.white,
                                                  fontSize: 12.0))),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            refundFilter = !refundFilter;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: refundFilter
                                                  ? Colors.white
                                                  : Color(0xFF5D5FEF),
                                              border: Border.all(
                                                  color: Color(0xFF5D5FEF)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: (Text('Refund',
                                              style: TextStyle(
                                                  color: refundFilter
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
                                          filterButton = true;
                                          if (bookedFilter == false &&
                                              scheduledFilter == true)
                                            finalList = bookedList;
                                          if (scheduledFilter == false &&
                                              bookedFilter == true)
                                            finalList = scheduledList;
                                          if ((bookedFilter == true &&
                                                  scheduledFilter == true) ||
                                              (bookedFilter == false &&
                                                  scheduledFilter == false))
                                            finalList = bookingDetails;
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
