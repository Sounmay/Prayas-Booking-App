import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsCenterCard.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsFacilityGrid.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsMainCard.dart';

class ServiceDetailsScreen extends StatefulWidget {
  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Services Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceDetailsMainCard(
                  'Dr. Mukund Dev', 'Speciality in Orthopedic'),
              SizedBox(height: 15),
              ServiceCardDetailsCenterCard(),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.only(left: 20), child: Text('Facility1')),
              Padding(
                  padding: EdgeInsets.only(left: 20), child: Text('Facility2')),
              Padding(
                  padding: EdgeInsets.only(left: 20), child: Text('Facility3')),
              ServiceDetailsFacilityGrid(),
              Center(
                child: FlatButton(
                  child: Text(
                    'Book an appointment',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xff5D5FEF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
