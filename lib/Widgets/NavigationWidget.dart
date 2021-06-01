import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/CalanderScreen.dart';
import 'package:freelance_booking_app/Screens/Home.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsMedical.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    ServiceDetailsMedical(),
    CalanderScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Services'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Bookings'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}