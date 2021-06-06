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
    return Container(
      width: 200,
      child: Drawer(
          child: Column(
        children: [
          Container(
            color: Color(0xFF5D5FEF),
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  foregroundImage: AssetImage('assets/profilepic.png'),
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
                Icon(Icons.person_outline_rounded, color: Color(0xFF5D5FEF)),
                Text(' Account', style: TextStyle(color: Color(0xFF5D5FEF)))
              ],
            ),
          )),
          FlatButton(
              child: Container(
            height: 40,
            child: Row(
              children: [
                Icon(Icons.person, color: Color(0xFF5D5FEF)),
                Text(' Services', style: TextStyle(color: Color(0xFF5D5FEF)))
              ],
            ),
          )),
          FlatButton(
              child: Container(
            height: 40,
            child: Row(
              children: [
                Text(' \u20B9',
                    style: TextStyle(color: Color(0xFF5D5FEF), fontSize: 20)),
                Text(' Cashback', style: TextStyle(color: Color(0xFF5D5FEF)))
              ],
            ),
          ))
        ],
      )),
    );
  }
}
