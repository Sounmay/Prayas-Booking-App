import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';
import 'package:freelance_booking_app/Providers/authProvider.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/database.dart';
import 'package:freelance_booking_app/Providers/locationProvider.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:freelance_booking_app/Screens/AllServices.dart';
import 'package:freelance_booking_app/Screens/Catalogue.dart';
import 'package:freelance_booking_app/Screens/DoctorSlotBooking.dart';
import 'package:freelance_booking_app/Screens/SearchScreen.dart';
import 'package:freelance_booking_app/Screens/MyBookings.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsParlour.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsSalon.dart';
import 'package:freelance_booking_app/Screens/SlotBooking.dart';
import 'package:freelance_booking_app/Screens/SplashScreen.dart';
import 'package:freelance_booking_app/Screens/UploadAvatarScreen.dart';
import 'package:freelance_booking_app/Screens/Wrapper.dart';
import 'package:freelance_booking_app/Screens/PaymentScreen.dart';
import 'package:freelance_booking_app/Widgets/Login.dart';
import 'Screens/Authenticate.dart';
import 'Screens/BookAppointment.dart';
import 'Screens/ServiceDetailsMedical.dart';
import 'package:provider/provider.dart';
import 'package:freelance_booking_app/Widgets/ExpandedMap.dart';

import 'Screens/aboutUs.dart';

// check push comment

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      // value: AuthProvider().user,
      value: AuthProvider().curreUser,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => CartService()),
          ChangeNotifierProvider(create: (ctx) => LocationProvider()),
          ChangeNotifierProvider(create: (ctx) => NavigationProvider()),
          StreamProvider<List<Medical>>.value(
            initialData: [],
            value: DatabaseService().streamMedical(),
            child: AllSerives(),
          ),
          StreamProvider<List<Parlour>>.value(
            initialData: [],
            value: DatabaseService().streamParlour(),
            child: AllSerives(),
          ),
          StreamProvider<List<Parlour>>.value(
            initialData: [],
            value: DatabaseService().streamParlourForSlots(),
            child: SlotBooking(),
          ),
          StreamProvider<List<Medical>>.value(
            initialData: [],
            value: DatabaseService().streamMedicalForSlots(),
            child: DoctorSlotBooking(),
          ),
          StreamProvider<List<Salon>>.value(
            initialData: [],
            value: DatabaseService().streamSalonForSlots(),
            child: SlotBooking(),
          ),
          StreamProvider<List<Salon>>.value(
            value: DatabaseService().streamSalon(),
            initialData: [],
            child: AllSerives(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Color(0xff5D5FEF)),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/wrapper': (context) => Wrapper(),
            '/serviceDetailsMedical': (context) => ServiceDetailsMedical(),
            '/serviceDetailsParlour': (context) => ServiceDetailsParlour(),
            '/serviceDetailsSalon': (context) => ServiceDetailsSalon(),
            '/bookAppointment': (context) => BookAppointment(),
            '/slotBooking': (context) => SlotBooking(),
            '/searchScreen': (context) => SearchScreen(),
            '/myBookings': (context) => MyBooking(),
            '/paymentScreen': (context) => PaymentScreen(),
            '/login': (context) => Login(),
            '/uploadAvatar': (context) => UploadAvatar(),
            '/expandedmap': (context) => ExpandedMap(),
            '/cat': (context) => Catalogue(),
            '/aboutus': (context) => AboutUs()
          },
        ),
      ),
    );
  }
}
