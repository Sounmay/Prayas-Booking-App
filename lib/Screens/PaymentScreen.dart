import 'package:flutter/material.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

//issue - need

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
            height: 40,
            width: 100,
            color: Colors.black,
            child: Text("$total",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        )
    );
  }
}
