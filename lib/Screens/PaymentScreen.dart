import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Cart.dart';
import 'package:freelance_booking_app/Providers/database.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  final double total;
  final Cart cart;
  final String id;
  PaymentScreen({this.total, this.cart, this.id});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

//issue - need to add Razorpay API with account verified

class _PaymentScreenState extends State<PaymentScreen> {
//  final int total;
  Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckOut(total) async {
    var options = {
      'key': 'rzp_test_xH5sd6KM7P8uMT',
      'amount': total * 100,
      'name': 'Booking Application',
      'description': 'Test Payment',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  final _db = DatabaseService();
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    String pid = response.paymentId;
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
    String otp = randomAlphaNumeric(6);
    widget.cart.addOtp(otp);
    widget.cart.addGST(widget.total.toInt());
    FirebaseFirestore.instance.collection('successPayments').doc().set({
      "paymentId": response.paymentId,
      "cart": widget.cart.toJson(widget.id)
    });
    _db.addBookingofCustomer(widget.cart, widget.id);
    _db.addCustomerBookingToServiceProvider(widget.cart, widget.id);
    showCupertinoDialog(
        context: context,
        builder: (context) {
          final navigator = Provider.of<NavigationProvider>(context);
          return CupertinoAlertDialog(
            title: Text("Payment Successful!"),
            content: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Text("Your payment was completed sucessfully and the order has been created.")
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    navigator.changeWidgetIndex(1);
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName("/wrapper"));
                  },
                  style: TextButton.styleFrom(
                    primary: Color(0xff5D5FEF),
                  ),
                  child: Text('Ok', style: TextStyle(color: Colors.black),))
            ],
          );
        });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " . " + response.message);
    showCupertinoDialog(
        context: context,
        builder: (context) {
          final navigator = Provider.of<NavigationProvider>(context);
          return CupertinoAlertDialog(
            title: Text("Payment Failed"),
            content: Container(
              height: 50,
              width: 50,
              child: Center(
                  child: Text("Your payment failed due to some reason. Please try again.")
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    navigator.changeWidgetIndex(1);
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName("/wrapper"));
                  },
                  style: TextButton.styleFrom(
                    primary: Color(0xff5D5FEF),
                  ),
                  child: Text('Ok', style: TextStyle(color: Colors.black),))
            ],
          );
        });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL WALLET " + response.walletName);
    Navigator.pushNamed(context, '/wrapper');
  }

  @override
  Widget build(BuildContext context) {
    // final _cartservice = Provider.of<CartService>(context);
    // final args =
    //     ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    // final id = args['id'];
    // final total = args['total'];
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFF0F2735),
                title: Row(
                  children: [
                    Text('Complete your booking',
                        style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
                  ],
                )),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "Amount to be paid : Rs " +  "${widget.total}",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      openCheckOut(widget.total);
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blueAccent),
                    child: Text(
                      "Complete your Payment",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            )));
  }
}
