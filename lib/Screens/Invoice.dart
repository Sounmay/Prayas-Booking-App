import 'package:flutter/material.dart';

import 'dart:ui';

class Invoice extends StatefulWidget {
  Invoice({Key key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(height: 80, color: Color(0xff5D5FEF)),
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
                          Text('Ankur Patel',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text('Perfect Salon,',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontWeight: FontWeight.bold)),
                          Text('Address line 1,',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontWeight: FontWeight.bold)),
                          Text('Address line 2,',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontWeight: FontWeight.bold)),
                          Text('24675889, psalon99@yahoo.com',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontWeight: FontWeight.bold))
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
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('Haircut')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('Shaving')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('Massage')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('Haircut')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('GST1')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('GST2')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.crop_3_2,
                                          color: Colors.black, size: 10),
                                      SizedBox(width: 5),
                                      Text('Refund')
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('\u20B9 100'),
                                  SizedBox(height: 10),
                                  Text('\u20B9 100'),
                                  SizedBox(height: 10),
                                  Text('\u20B9 100'),
                                  SizedBox(height: 10),
                                  Text('\u20B9 100'),
                                  SizedBox(height: 10),
                                  Text('\u20B9 100'),
                                  SizedBox(height: 10),
                                  Text('\u20B9 100'),
                                  SizedBox(height: 10),
                                  Text('- \u20B9 100')
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
                            Text('\u20B9 400/-',
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
                  SizedBox(height: 20),
                  TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Download',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF0F2735),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(height: 80, color: Color(0xff5D5FEF))
          ],
        )),
      ),
    );
  }
}
