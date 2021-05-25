import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Widgets/ServiceListMainCard.dart';

class ServiceListDoctor extends StatefulWidget {
  @override
  _ServiceListDoctorState createState() => _ServiceListDoctorState();
}

class _ServiceListDoctorState extends State<ServiceListDoctor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ServiceListMainCard(),
    );
  }
}

