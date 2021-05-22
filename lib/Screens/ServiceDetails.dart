import 'package:flutter/material.dart';

class ServiceDetails extends StatefulWidget {
  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Container(
        child: Text('Service Details page'),
      ),
    );
  }
}
