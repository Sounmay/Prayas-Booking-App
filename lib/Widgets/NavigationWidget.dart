import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/BookAppointment.dart';
import 'package:freelance_booking_app/Screens/Home.dart';
import 'package:freelance_booking_app/Screens/ServiceDetailsMedical.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Home(), Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   unselectedItemColor: Colors.black,
        //   selectedItemColor: Colors.white,
        //   backgroundColor: Colors.blueAccent,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(icon: Icon(Icons.note), label: ''),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.favorite_outline,
        //       ),
        //       label: '',
        //     ),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(0),
          color: Color(0xff5D5FEF),
          height: 56,
          width: 400,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  height: 56,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color(0xff5D5FEF),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Icon(Icons.home_outlined,
                            size: 30, color: Colors.white),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _currentIndex = 2;
                            });
                          },
                          child: Icon(Icons.favorite_outline,
                              size: 30, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -20,
                left: 100,
                right: 100,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: FittedBox(
                    child: FloatingActionButton(
                      backgroundColor: Color(0xFF0F2735),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Icon(Icons.calendar_today,
                          size: 30, color: Color(0xff5D5FEF)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
