import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/User.dart';
import 'package:freelance_booking_app/Providers/authProvider.dart';
import 'package:freelance_booking_app/Screens/AuthScreens/phoneRegisterScreen.dart';
import 'package:freelance_booking_app/Screens/Authenticate.dart';
import 'package:freelance_booking_app/Widgets/NavigationWidget.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      // return Authenticate();
      return PhoneRegisterScreen(user: user);
    } else {
      return BottomNavBar();
    }
  }
}
