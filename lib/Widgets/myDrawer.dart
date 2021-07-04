import 'dart:ui';

import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  Mydrawer({Key key}) : super(key: key);

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        child: Drawer(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  color: Color(0xFF5D5FEF),
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/uploadAvatar');
                        },
                        child: CircleAvatar(
                          radius: 32,
                          foregroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/freelance-booking-app.appspot.com/o/userImage%2FIMG_20170128_065337.jpg?alt=media&token=41f944c7-bc56-4c4e-b360-def099555c80'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Lokesh Jain',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                FlatButton(
                    child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.person_outline_rounded,
                          color: Color(0xFF5D5FEF)),
                      Text(' Account',
                          style: TextStyle(color: Color(0xFF5D5FEF)))
                    ],
                  ),
                )),
                FlatButton(
                    child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Color(0xFF5D5FEF)),
                      Text(' Services',
                          style: TextStyle(color: Color(0xFF5D5FEF)))
                    ],
                  ),
                )),
                FlatButton(
                    child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      Text(' \u20B9',
                          style: TextStyle(
                              color: Color(0xFF5D5FEF), fontSize: 20)),
                      Text(' Cashback',
                          style: TextStyle(color: Color(0xFF5D5FEF)))
                    ],
                  ),
                ))
              ],
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      Text(' Sign Out',
                          style: TextStyle(color: Color(0xFF5D5FEF)))
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
