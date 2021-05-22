import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/LoginScreen.dart';

import 'Screens/ServiceDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/serviceDetails': (context) => ServiceDetails()
      },
    );
  }
}
