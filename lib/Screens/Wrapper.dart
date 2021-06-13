import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/User.dart';
import 'package:freelance_booking_app/Screens/Authenticate.dart';
import 'package:freelance_booking_app/Widgets/MapWidget.dart';
import 'package:freelance_booking_app/Widgets/NavigationWidget.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return BottomNavBar();
    }
  }
}