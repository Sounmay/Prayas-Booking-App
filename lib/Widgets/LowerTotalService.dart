import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Screens/PaymentScreen.dart';
import 'package:provider/provider.dart';

class LowerCardServiceTotal extends StatelessWidget {
  final id;
  final bool isSlotPage;
  final Function onSlotBooking;
  const LowerCardServiceTotal(
      {Key key, this.isSlotPage = false, this.id, this.onSlotBooking})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<CartService>(context).services;
    // final gst1 = service[id] != null ? service[id].subtotal * 0.08 ?? 0 : 0;
    // final gst2 = service[id] != null ? service[id].subtotal * 0.08 ?? 0 : 0;
    final time = service[id] != null ? service[id].time : 0;

    final int minute = time % 60;
    final int hours = (time / 60).floor();
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: Color(0xFFF7F7F7),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("Subtotal Amount",
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //           fontSize: 17,
        //         )),
        //     Text(service[id] != null ? "${service[id].subtotal}" : "0",
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //           fontSize: 17,
        //         ))
        //   ],
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("GST 1 ( 8% )",
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //           fontSize: 17,
        //         )),
        //     Text(service[id] != null ? "$gst1" : "0",
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //           fontSize: 17,
        //         ))
        //   ],
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("GST 2 ( 8% )",
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //           fontSize: 17,
        //         )),
        //     Text(
        //         service[id] != null && service[id].subtotal != null
        //             ? "$gst2"
        //             : "0",
        //         style: TextStyle(
        //           color: Colors.grey[600],
        //           fontSize: 17,
        //         ))
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Net Amount",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            Text(
                service[id] != null && service[id].subtotal != null
                    ? "₹ ${service[id].subtotal}/-"
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
                  service[id] != null && service[id].time != null
                      ? "$hours hr $minute min"
                      : "0",
                  style: TextStyle(
                      color: Color(0xff5D5FEF),
                      fontSize: 17,
                      fontWeight: FontWeight.w500)),
            ])
          ],
        ),
        if (!isSlotPage)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  onSlotBooking();
                  // Navigator.pushNamed(context, '/slotBooking', arguments: {
                  //   'employeeNumbers': employeeNumbers,
                  //   'id': id,
                  //   'slots': slots,
                  //   'shopName': shopName,
                  //   'address': address
                  // });
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
          ),
        if (isSlotPage)
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
                    // if (dateSelected == true && slotSelected == true) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PaymentScreen(
                    //             total: double.parse(
                    //                 paymentValue.toStringAsFixed(2)),
                    //             cart: service,
                    //             id: id.toString())),
                    //   );
                    // } else {
                    //   Fluttertoast.showToast(
                    //       msg:
                    //           'Please select a date and slot for booking',
                    //       backgroundColor: Color(0xff5D5FEF),
                    //       textColor: Colors.white,
                    //       toastLength: Toast.LENGTH_LONG);
                    // }
                  },
                )
              ],
            ),
          )
      ]),
    );
  }
}
