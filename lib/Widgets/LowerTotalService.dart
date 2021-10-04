import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freelance_booking_app/Models/Cart.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:freelance_booking_app/Screens/PaymentScreen.dart';
import 'package:provider/provider.dart';

class LowerCardServiceTotal extends StatelessWidget {
  final id;
  final String clinicId;
  final Cart service;
  final bool isSlotPage, showCheckBox, isChecked, dateSelected, slotSelected;
  final Function onSlotBooking, setIsChecked, bookingConfirm;
  const LowerCardServiceTotal(
      {Key key,
      this.service,
      this.clinicId,
      this.isSlotPage = false,
      this.bookingConfirm,
      this.isChecked,
      this.dateSelected,
      this.slotSelected,
      this.setIsChecked,
      this.showCheckBox = false,
      this.id,
      this.onSlotBooking})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<CartService>(context).services;
    final navigator = Provider.of<NavigationProvider>(context);

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
            Text("For ${service[id]?.serviceName?.length ?? "0"} services",
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
                    'Book an Appointment',
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
//              TextButton(
//                child: Text(
//                  'Emergency booking',
//                  style: TextStyle(color: Colors.white),
//                ),
//                style: TextButton.styleFrom(
//                  backgroundColor: Color(0xff5D5FEF),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(5)),
//                ),
//                onPressed: () {},
//              )
            ],
          ),
        if (isSlotPage && showCheckBox)
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Color(0xff5D5FEF),
                  value: isChecked,
                  onChanged: (bool value) {
                    setIsChecked(value);
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text('Pay by cash after service is over.')
              ],
            ),
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
                      bookingConfirm(service[id], clinicId);
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
                          msg: 'Please select a date and slot for booking',
                          backgroundColor: Color(0xff5D5FEF),
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_LONG);
                    }
                  },
                )
              ],
            ),
          )
      ]),
    );
  }
}
