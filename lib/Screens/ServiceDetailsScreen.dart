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
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              title: Text('Medical Services'),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 5, top: 5),
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0F2735),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/doctor.png')))
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceDetailsMainCard(
                  'Dr. Mukund Dev', 'Speciality in Orthopedic'),
              SizedBox(height: 8),
              ServiceCardDetailsCenterCard(),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Facility1')),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Facility2')),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Facility3')),
              ServiceDetailsFacilityGrid(),
              Center(
                child: TextButton(
                  child: Text(
                    'Book an appointment',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff5D5FEF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
