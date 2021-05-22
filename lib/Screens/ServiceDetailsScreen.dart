import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsCenterCard.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ServiceDetailsMainCard(
                'Dr. Mukund Dev', 'Speciality in Orthopedic'),
            SizedBox(height: 20),
            ServiceCardDetailsCenterCard()
          ],
        ));
  }
}
