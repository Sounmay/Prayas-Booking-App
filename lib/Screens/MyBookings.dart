import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:flutter/material.dart';

class MyBooking extends StatefulWidget {
  MyBooking({Key key}) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            LocationNameWidget(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              height: 70,
              child: TextFormField(
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

          ],),
        ),
      ),
    );
  }
}