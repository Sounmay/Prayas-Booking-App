import 'package:flutter/material.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

//issue - need to add Razorpay API with account

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final id = args['id'];
    final total=args['total'];
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xFF0F2735),
              title: Row(
                children: [
                  Text('Payment',
                      style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
                ],
              )
          ),
          body: Container(
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
        )
    );
  }
}
