import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/Home.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsParlour.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsSalon.dart';
import 'Screens/CalanderScreen.dart';
import 'Screens/ServiceDetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff5D5FEF)),
      initialRoute: '/',
      routes: {
        // '/': (context) => LoginScreen(),
        '/': (context) => BottomNavBar(),
        '/serviceDetails': (context) => ServiceDetailsScreen(),
        '/serviceDetailsParlour': (context) => ServiceDetailsParlour(),
        '/serviceDetailsSalon': (context) => ServiceDetailsSalon(),
        '/calanderScreen': (context) => CalanderScreen()
      },
    );
  }
}
