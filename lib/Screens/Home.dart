import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/User.dart';
import 'package:freelance_booking_app/Providers/medicalServices.dart';
import 'package:freelance_booking_app/Providers/parlourServices.dart';
import 'package:freelance_booking_app/Providers/salonServices.dart';
import 'package:freelance_booking_app/Widgets/ServiceListDoctor.dart';
import 'package:freelance_booking_app/Widgets/ServiceListSalon.dart';
import 'package:freelance_booking_app/Widgets/ServiceListParlour.dart';
import 'package:freelance_booking_app/Widgets/searchBar.dart';
import 'package:provider/provider.dart';
import 'package:freelance_booking_app/Widgets/MapWidget.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pressed1 = true;
  var pressed2 = false;
  var pressed3 = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final medicalservicesList = Provider.of<MedicalServices>(context).services;
    final parlourservicesList = Provider.of<ParlourServices>(context).services;
    final serviceservicesList = Provider.of<SalonServices>(context).services;
    Widget medicalListBuilder = Container(
        height: 300,
        child: ListView.builder(
          itemCount: medicalservicesList.length,
          itemBuilder: (ctx, j) => ServiceListDoctor(
            service: medicalservicesList[j],
          ),
        ));
    Widget parlourListBuilder = Container(
        height: 300,
        child: ListView.builder(
          itemCount: medicalservicesList.length,
          itemBuilder: (ctx, j) => ServiceListParlour(
            service: parlourservicesList[j],
          ),
        ));
    Widget salonListBuilder = Container(
        height: 300,
        child: ListView.builder(
          itemCount: medicalservicesList.length,
          itemBuilder: (ctx, j) => ServiceListSalon(
            service: serviceservicesList[j],
          ),
        ));
    List<Widget> serviceWidget = [
      medicalListBuilder,
      parlourListBuilder,
      salonListBuilder
    ];
    return Scaffold(
//        appBar: AppBar(
//          title: Text('Home'),
//          leading: InkWell(
//              onTap: () {
//                FirebaseAuth.instance.signOut();
//                // FirebaseFirestore.instance
//                //     .collection('users')
//                //     .doc("${user.uid}")
//                //     .set({"name": "imam"});
//              },
//              child: Icon(Icons.logout)),
//        ),
        body: Container(
          child: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                LocationNameWidget(),
                SizedBox(
                  height: 10.0,
                ),
                SearchBar(),
                SizedBox(
                  height: 20.0,
                ),
                MapWidget(),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Services Provided',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            pressed1 = true;
                            pressed2 = false;
                            pressed3 = false;
                            i = 0;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/doctor 3.png')),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Doctors',
                                  style: TextStyle(
                                      color: pressed1
                                          ? Colors.white
                                          : Color(0xFF5D5FEF),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color:
                                  pressed1 ? Color(0xFF5D5FEF) : Colors.white,
                              height: 25.0,
                              minWidth: 45.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: Color(0xFF5D5FEF),
                                      width: 1,
                                      style: BorderStyle.solid)),
                              onPressed: () {
                                setState(() {
                                  pressed1 = true;
                                  pressed2 = false;
                                  pressed3 = false;
                                  i = 0;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            pressed1 = false;
                            pressed2 = true;
                            pressed3 = false;
                            i = 1;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/Group 30.png')),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Parlour',
                                  style: TextStyle(
                                      color: pressed2
                                          ? Colors.white
                                          : Color(0xFF5D5FEF),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color:
                                  pressed2 ? Color(0xFF5D5FEF) : Colors.white,
                              height: 25.0,
                              minWidth: 45.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: Color(0xFF5D5FEF),
                                      width: 1,
                                      style: BorderStyle.solid)),
                              onPressed: () {
                                setState(() {
                                  pressed1 = false;
                                  pressed2 = true;
                                  pressed3 = false;
                                  i = 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            pressed1 = false;
                            pressed2 = false;
                            pressed3 = true;
                            i = 2;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/Group 32.png')),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Salon',
                                  style: TextStyle(
                                      color: pressed3
                                          ? Colors.white
                                          : Color(0xFF5D5FEF),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color:
                                  pressed3 ? Color(0xFF5D5FEF) : Colors.white,
                              height: 25.0,
                              minWidth: 45.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: Color(0xFF5D5FEF),
                                      width: 1,
                                      style: BorderStyle.solid)),
                              onPressed: () {
                                setState(() {
                                  pressed1 = false;
                                  pressed2 = false;
                                  pressed3 = true;
                                  i = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Services Near By',
                      style: TextStyle(
                          color: Color(0xFF5D5FEF),
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                  ),
                ),
                serviceWidget[i]
              ],
            ),
          ),
        ));
  }
}
