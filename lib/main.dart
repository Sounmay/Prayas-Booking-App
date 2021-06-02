import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/medicalServices.dart';
import 'package:freelance_booking_app/Providers/parlourServices.dart';
import 'package:freelance_booking_app/Providers/salonServices.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsParlour.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsSalon.dart';
import 'package:freelance_booking_app/Screens/SlotBooking.dart';
import 'package:freelance_booking_app/Widgets/NavigationWidget.dart';
import 'Screens/BookAppointment.dart';
import 'Screens/ServiceDetailsMedical.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MedicalServices(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ParlourServices(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SalonServices(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartService()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xff5D5FEF)),
        initialRoute: '/',
        routes: {
          '/': (context) => BottomNavBar(),
          '/serviceDetailsMedical': (context) => ServiceDetailsMedical(),
          '/serviceDetailsParlour': (context) => ServiceDetailsParlour(),
          '/serviceDetailsSalon': (context) => ServiceDetailsSalon(),
          '/bookAppointment': (context) => BookAppointment(),
          '/slotBooking' : (context) => SlotBooking()
        },
      ),
    );
  }
}
