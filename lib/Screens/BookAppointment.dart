import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/User.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/parlourServices.dart';
import 'package:provider/provider.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String userName = '';

  _loadData() async {
    final data = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    userName = data['name'];
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  int getCatalogue = 2;
  bool serviceAdded = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final int employeeNumbers = args['employeeNumbers'];
    print(employeeNumbers);
    final id = args['id'];
    final slots = args['slots'];
    final slotsArray = args['slotsArray'];
    final bookedSlotsPerDay = args['bookedSlotsPerDay'];
    final shopName = args['shopName'];
    final address = args['address'];
    List<ParlourServiceDetails> mostAvailed = args['mostAvailService'];
    final cart = Provider.of<CartService>(context);
    final service = Provider.of<CartService>(context).services;
    final gst1 = service[id] != null ? service[id].subtotal * 0.08 ?? 0 : 0;
    final gst2 = service[id] != null ? service[id].subtotal * 0.08 ?? 0 : 0;
    final time = service[id] != null ? service[id].time : 0;
    final int minute = time % 60;
    final int hours = (time / 60).floor();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF0F2735),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Book your appointment',
                      style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
                ),
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
                        'assets/croppedParlour.png',
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
                              shopName ?? "Perfect Salon",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ],
                        )),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Container(
                      height: height * 0.05,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Most availed services",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {
                                  cart.removeAllServices(id);
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(color: Colors.grey),
                                ))
                          ]),
                    )),
                mostAvailed.length != 0
                    ? Container(
                        height: height * 0.26,
                        child: ListView.builder(
                            itemCount: mostAvailed.length,
                            itemBuilder: (ctx, i) {
                              int hr = int.parse(mostAvailed[i]?.hour) ?? 0;
                              int min = int.parse(mostAvailed[i]?.minute) ?? 0;
                              return Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                        height: 30,
                                        width: 2.3,
                                        color: Color(0xff5D5FEF),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mostAvailed[i].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "₹ " +
                                                "${mostAvailed[i].price}" +
                                                " | " +
                                                "${mostAvailed[i].hour} Hr ${mostAvailed[i].minute} Min",
                                            style: TextStyle(
                                                color: Color(0xFF606572)),
                                          )
                                        ],
                                      ),
                                    ]),
                                    service[id] != null &&
                                            service[id]
                                                .serviceName
                                                .contains(mostAvailed[i].name)
                                        ? SizedBox(
                                            height: 30,
                                            width: 60,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff02CF96),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  "Added",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          )
                                        : SizedBox(
                                            height: 30,
                                            width: 50,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff5D5FEF),
                                                ),
                                                onPressed: () {
                                                  cart.addServices(
                                                      id,
                                                      mostAvailed[i].name,
                                                      int.parse(
                                                          mostAvailed[i].price),
                                                      hr * 60 + min,
                                                      shopName,
                                                      userName,
                                                      address);
                                                  serviceAdded = true;
                                                },
                                                child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          )
                                  ],
                                ),
                              );
                            }))
                    : Container(
                        height: height * 0.2,
                        child: Center(child: CircularProgressIndicator())),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Services',
                        style: TextStyle(
                            color: Colors.indigo[400],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      TextButton(
                        child: Text(
                          'Check Catalogue',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF0F2735),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/cat', arguments: {
                            'id': id,
                            'shopName': shopName,
                            'userName': userName,
                            'mostAvailed': mostAvailed,
                            'getCatalogue': getCatalogue
                          });
                        },
                      )
                    ],
                  ),
                ),
                service[id] != null
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: height * 0.12,
                        width: width,
                        color: Color(0xFFF7F7F7),
                        child: Wrap(
                          children: [
                            ...List.generate(
                              service[id].serviceName.length,
                              (i) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Chip(
                                  backgroundColor: Color(0xff5D5FEF),
                                  label: Text(
                                      '${service[id].serviceName[i]} | ${service[id].price[i]}',
                                      style: TextStyle(color: Colors.white)),
                                  deleteIconColor: Colors.white,
                                  onDeleted: () {
                                    cart.removeServices(
                                      id,
                                      service[id].serviceName[i],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ))
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        color: Color(0xFFF7F7F7),
                        height: height * 0.12,
                        child: null,
                      ),
                SizedBox(height: 10.0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: Color(0xFFF7F7F7),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal Amount",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                )),
                            Text(
                                service[id] != null
                                    ? "${service[id].subtotal}"
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
                            Text("GST 1 ( 8% )",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                )),
                            Text(
                                service[id] != null
                                    ? "${gst1.toStringAsFixed(2)}"
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
                            Text("GST 2 ( 8% )",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                )),
                            Text(
                                service[id] != null &&
                                        service[id].subtotal != null
                                    ? "${gst2.toStringAsFixed(2)}"
                                    : "0",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                ))
                          ],
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500)),
                            Text(
                                service[id] != null &&
                                        service[id].subtotal != null
                                    ? "₹ ${(service[id].subtotal).toStringAsFixed(2)}/-"
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
                                  service[id] != null &&
                                          service[id].time != null
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
                                if (service[id] == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please add atleast one service",
                                      backgroundColor: Color(0xff5D5FEF),
                                      textColor: Colors.white);
                                } else {
                                  Navigator.pushNamed(context, '/slotBooking',
                                      arguments: {
                                        'employeeNumbers': employeeNumbers,
                                        'id': id,
                                        'slots': slots,
                                        'shopName': shopName,
                                        'slotsArray': slotsArray,
                                        'bookedSlotsPerDay': bookedSlotsPerDay,
                                        'address': address
                                      });
                                }
                              },
                            ),
                            /*SizedBox(
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
                            )*/
                          ],
                        )
                      ]),
                ),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
