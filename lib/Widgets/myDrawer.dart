import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:freelance_booking_app/Screens/ProfileScreen.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marquee/marquee.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class Mydrawer extends StatefulWidget {
  Mydrawer({Key key}) : super(key: key);

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  bool load = true;
  String name = "", userImage;
  File _image;

  String userId = '${FirebaseAuth.instance.currentUser.uid}';
  name1(String uid) async {
    try {
      final data =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      setState(() {
        name = data['name'];
        userImage = data['image'];
        load = false;
      });
    } catch (e) {
      e.toString();
    }
  }

  Future _getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
      print('_image: $_image');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name1(FirebaseAuth.instance.currentUser.uid);
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<NavigationProvider>(context);

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
//                            onTap: _getImage,
                        onTap: () {
                          Navigator.pushNamed(context, '/uploadAvatar');
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(top: 4, right: 5),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: userImage,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.width * 0.36,
                              placeholder: (context, url) => new SizedBox(
                                height: 200,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Icon(Icons.image, size: 40),
                                      ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 2, sigmaY: 2),
                                          child: Container(
                                            color: Colors.grey[200]
                                                .withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  new Image.asset('assets/parlourTile.png'),
                            ),
                          ),
                          // AssetImage('assets/doctor.png'),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child:
                              // Text(
                              //   name,
                              //   style: TextStyle(color: Colors.white, fontSize: 15),
                              // )
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: 20,
                                  child: MarqueeText(
                                    speed: 10,
                                    text: name.contains(" ")
                                        ? name?.split(" ")[0]
                                        : name ?? "...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )))
                    ],
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(Icons.person_outline_rounded,
                              color: Color(0xFF5D5FEF)),
                          Text(' Profile',
                              style: TextStyle(color: Color(0xFF5D5FEF)))
                        ],
                      ),
                    )),
                // FlatButton(
                //     child: Container(
                //   height: 40,
                //   child: Row(
                //     children: [
                //       Icon(Icons.person, color: Color(0xFF5D5FEF)),
                //       Text(' Services',
                //           style: TextStyle(color: Color(0xFF5D5FEF)))
                //     ],
                //   ),
                // )),
                FlatButton(
                    onPressed: () {
                      navigator.changeWidgetIndex(1);
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(Icons.book_online, color: Color(0xFF5D5FEF)),
                          Text(' My Bookings',
                              style: TextStyle(color: Color(0xFF5D5FEF)))
                        ],
                      ),
                    ))
              ],
            ),
            FlatButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
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
