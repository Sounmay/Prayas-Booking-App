import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Widgets/ServiceListDoctor.dart';

class ClinicDoctorListPage extends StatefulWidget {
  final Medical clinicDetails;
  const ClinicDoctorListPage({Key key, this.clinicDetails}) : super(key: key);

  @override
  _ClinicDoctorListPageState createState() => _ClinicDoctorListPageState();
}

class _ClinicDoctorListPageState extends State<ClinicDoctorListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              widget.clinicDetails.doctorDetails.length,
              (index) => ServiceListDoctor(
                service: widget.clinicDetails.doctorDetails[index],
                location: widget.clinicDetails.clinicLocationAndDoctor.address,
                clinicDetails: widget.clinicDetails.clinicLocationAndDoctor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
