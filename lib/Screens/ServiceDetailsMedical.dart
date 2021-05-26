import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsCenterCard.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsFacilityGrid.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsMainCard.dart';

class ServiceDetailsMedical extends StatefulWidget {
  @override
  _ServiceDetailsMedicalState createState() => _ServiceDetailsMedicalState();
}

class _ServiceDetailsMedicalState extends State<ServiceDetailsMedical> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final service = args['details'];
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              title: Text('Medical \nServices'),
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
              ServiceDetailsMainCard(service.name, 'Speciality in Orthopedic'),
              SizedBox(height: 8),
              ServiceCardDetailsCenterCard(service),
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
