import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mydrawer extends StatefulWidget {
  Mydrawer({Key key}) : super(key: key);

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  bool load = true;
  String name = '';

  String userId = '${FirebaseAuth.instance.currentUser.uid}';
  name1(String uid) async {
    try {
      final data =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      setState(() {
        name = data['name'];
        load = false;
      });
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (load) {
      name1(userId);
    }
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
                          child:
                              /* load == false
                            ? */
                              Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                          /* : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [CircularProgressIndicator()],
                                ),
                              )*/
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
