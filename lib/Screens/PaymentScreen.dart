import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

//issue - need to add Razorpay API with account

class _PaymentScreenState extends State<PaymentScreen> {
  int total=100;
  Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay=Razorpay();
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

  void openCheckOut(total) async{
    var options = {
      'key':'rzp_test_xH5sd6KM7P8uMT',
      'amount': total*100,
      'name': 'Booking Application',
      'description' : 'Test Payment',
      'prefill' : {'contact' : '', 'email': ''},
      'external' : {
        'wallets' : ['paytm']
      }
    };

    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCCESS: "+response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "ERROR: "+response.code.toString() + " . "+response.message);
  }
  
  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "EXTERNAL WALLET " + response.walletName);
  }



  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final id = args['id'];
    final total=args['total'];
//    int totalamount=num.parse(total);
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
              )
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.black,
                child: Center(
                  child: Text("Amount to be paid : Rs "+" $total",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: (){
                    openCheckOut(total);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blueAccent
                  ),
                  child: Text("Complete your Payment",
                    style: TextStyle(
                        color: Colors.white,
                    ),
                  )
              )
            ],
          )
        )
    );
  }
}
