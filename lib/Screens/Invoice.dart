import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:freelance_booking_app/Models/Bookings.dart';
import 'package:marquee_text/marquee_text.dart';

class Invoice extends StatefulWidget {
  final BookingsDetails bookingsDetails;
  Invoice({this.bookingsDetails, Key key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    final date = widget.bookingsDetails.date.toDate();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF5D5FEF),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('INVOICE',
                    style: TextStyle(fontSize: 30.0, letterSpacing: 1.0)),
              ),
            ],
          )
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.89,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                          height: 80,
                          color: Color(0xff5D5FEF),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Receipt Number ',
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10),
                                    Text('Date',
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('  :  ',
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 10),
                                    Text('  :  ',
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('#${widget.bookingsDetails.otp}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text('${date.day}/${date.month}/${date.year}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 68),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5D5FEF)))
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Billed to',
                                    style: TextStyle(color: Color(0xff5D5FEF))),
                                SizedBox(height: 10),
                                Text('From',
                                    style: TextStyle(color: Color(0xff5D5FEF)))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  :  ',
                                    style: TextStyle(color: Color(0xff5D5FEF))),
                                SizedBox(height: 10),
                                Text('  :  ',
                                    style: TextStyle(color: Color(0xff5D5FEF)))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.bookingsDetails.custName}',
                                    style: TextStyle(
                                        color: Color(0xff5D5FEF),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                //${widget.bookingsDetails?.shopName ?? "..."}, ${widget.bookingsDetails?.address ?? "..."}.
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.7,
                                  height: 20,
                                  child: MarqueeText(
                                      speed: 10,
                                      alwaysScroll: false,
                                      text: '${widget.bookingsDetails?.shopName ?? "..."}, ${widget.bookingsDetails?.address ?? "..."}.',
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )
                                // Text('Address line 1,',
                                //     style: TextStyle(
                                //         color: Color(0xff5D5FEF),
                                //         fontWeight: FontWeight.bold)),
                                // Text('Address line 2,',
                                //     style: TextStyle(
                                //         color: Color(0xff5D5FEF),
                                //         fontWeight: FontWeight.bold)),
                                // Text('24675889, psalon99@yahoo.com',
                                //     style: TextStyle(
                                //         color: Color(0xff5D5FEF),
                                //         fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffF3F3F3)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text('Services', style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ...List.generate(
                                            widget.bookingsDetails.serviceList.length,
                                                (index) => Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.crop_3_2,
                                                        color: Colors.black,
                                                        size: 10),
                                                    SizedBox(width: 5),
                                                    Text(
                                                        '${widget.bookingsDetails.serviceList[index]}')
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ))
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.crop_3_2,
                                        //         color: Colors.black, size: 10),
                                        //     SizedBox(width: 5),
                                        //     Text('Shaving')
                                        //   ],
                                        // ),
                                        // SizedBox(height: 10),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.crop_3_2,
                                        //         color: Colors.black, size: 10),
                                        //     SizedBox(width: 5),
                                        //     Text('Massage')
                                        //   ],
                                        // ),
                                        // SizedBox(height: 10),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.crop_3_2,
                                        //         color: Colors.black, size: 10),
                                        //     SizedBox(width: 5),
                                        //     Text('Haircut')
                                        //   ],
                                        // ),
                                        // SizedBox(height: 10),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.crop_3_2,
                                        //         color: Colors.black, size: 10),
                                        //     SizedBox(width: 5),
                                        //     Text('GST1')
                                        //   ],
                                        // ),
                                        // SizedBox(height: 10),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.crop_3_2,
                                        //         color: Colors.black, size: 10),
                                        //     SizedBox(width: 5),
                                        //     Text('GST2')
                                        //   ],
                                        // ),
                                        // SizedBox(height: 10),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.crop_3_2,
                                        //         color: Colors.black, size: 10),
                                        //     SizedBox(width: 5),
                                        //     Text('Refund')
                                        //   ],
                                        // )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ...List.generate(
                                            widget.bookingsDetails.priceList.length,
                                                (index) => Column(
                                              children: [
                                                Text(
                                                    '\u20B9 ${widget.bookingsDetails.priceList[index]}'),
                                                SizedBox(height: 10)
                                              ],
                                            ))
                                        // Text('\u20B9 100'),
                                        // SizedBox(height: 10),
                                        // Text('\u20B9 100'),
                                        // SizedBox(height: 10),
                                        // Text('\u20B9 100'),
                                        // SizedBox(height: 10),
                                        // Text('\u20B9 100'),
                                        // SizedBox(height: 10),
                                        // Text('\u20B9 100'),
                                        // SizedBox(height: 10),
                                        // Text('\u20B9 100'),
                                        // SizedBox(height: 10),
                                        // Text('- \u20B9 100')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 3,
                                      color: Color(0xffFFC700),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Net Amount :',
                                      style: TextStyle(fontSize: 24)),
                                  Text(
                                      '\u20B9 ${widget.bookingsDetails.totalAmount}/-',
                                      style: TextStyle(
                                          fontSize: 24, color: Color(0xff5D5FEF)))
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('For 3 services (Incl.tax)'),
                                  Row(
                                    children: [
                                      Text('Status : '),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF3AD48A),
                                            borderRadius: BorderRadius.circular(5.0)),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle_outline_sharp,
                                                color: Colors.white, size: 20),
                                            Text('  Paid',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 30)
                            ],
                          ),
                        ),
                        //                  TextButton(
                        //                    child: Padding(
                        //                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        //                      child: Text(
                        //                        'Download',
                        //                        style: TextStyle(color: Colors.white),
                        //                      ),
                        //                    ),
                        //                    style: TextButton.styleFrom(
                        //                      backgroundColor: Color(0xFF0F2735),
                        //                      shape: RoundedRectangleBorder(
                        //                          borderRadius: BorderRadius.circular(5)),
                        //                    ),
                        //                    onPressed: () {},
                        //                  )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  color: Color(0xff5D5FEF),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("😊", style: TextStyle(fontSize: 23.0)),
                                      SizedBox(height: 5),
                                      Text('Thank You!',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                              letterSpacing: 1.0)),
                                      SizedBox(height: 8)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF))),
                              Container(
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Color(0xff5D5FEF)))
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
