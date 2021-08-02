import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';
import 'package:freelance_booking_app/Providers/medicalServices.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:freelance_booking_app/Providers/parlourServices.dart';
import 'package:freelance_booking_app/Providers/salonServices.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:freelance_booking_app/Widgets/ServiceListDoctor.dart';
import 'package:freelance_booking_app/Widgets/ServiceListParlour.dart';
import 'package:freelance_booking_app/Widgets/ServiceListSalon.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class AllSerives extends StatefulWidget {
  int serviceIndex;
  AllSerives({this.serviceIndex});
  @override
  _AllSerivesState createState() => _AllSerivesState();
}

class _AllSerivesState extends State<AllSerives> {
  bool initalState = true;

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadDatafromFirestore('Hujooxxby0bFjpKbf9DQQHQWhFh2');
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final navigator = Provider.of<NavigationProvider>(context);
    final serviceNavigator =
        Provider.of<NavigationProvider>(context).serviceIndex;
    final medicalFirebaseServiceList = Provider.of<List<Medical>>(context);
    final parlourFirebaseServiceList = Provider.of<List<Parlour>>(context);
    final salonFirebaseServiceList = Provider.of<List<Salon>>(context);
    Widget medicalListBuilder = Container(
        height: deviceHeight * 0.58,
        child: ListView.builder(
          itemCount: medicalFirebaseServiceList.length,
          itemBuilder: (ctx, j) => ServiceListDoctor(
            service: medicalFirebaseServiceList[j],
          ),
        ));
    Widget parlourListBuilder = Container(
        height: deviceHeight * 0.58,
        child: ListView.builder(
          itemCount: parlourFirebaseServiceList.length,
          itemBuilder: (ctx, j) => ServiceListParlour(
            service: parlourFirebaseServiceList[j],
          ),
        ));
    Widget salonListBuilder = Container(
        height: deviceHeight * 0.58,
        child: ListView.builder(
          itemCount: salonFirebaseServiceList.length,
          itemBuilder: (ctx, j) => ServiceListSalon(
            service: salonFirebaseServiceList[j],
          ),
        ));
    List<Widget> serviceWidget = [
      medicalListBuilder,
      parlourListBuilder,
      salonListBuilder
    ];
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LocationNameWidget(),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/searchScreen');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.search),
                      SizedBox(width: 4),
                      Text('Search for a service')
                    ],
                  ),
                ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    if ((initalState == true && serviceNavigator == 0) ||
                        initalState == false)
                      FlatButton(
                        color: serviceNavigator == 0
                            ? Color(0xFF5D5FEF)
                            : Color(0xFFE5E5E5),
                        height: 25.0,
                        minWidth: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        onPressed: () {
                          setState(() {
                            initalState = !initalState;
                          });
                          if (serviceNavigator != 0)
                            navigator.changeServiceIndex(0);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage('assets/doctor 3.png')),
                            ),
                            Text(
                              'Doctors',
                              style: TextStyle(
                                  color: serviceNavigator == 0
                                      ? Colors.white
                                      : Color(0xFF5D5FEF),
                                  fontWeight: FontWeight.bold),
                            ),
                            if (initalState)
                              Icon(Icons.arrow_right_outlined,
                                  color: Colors.white)
                          ],
                        ),
                      ),
                    if ((initalState == true && serviceNavigator == 1) ||
                        initalState == false)
                      FlatButton(
                        color: serviceNavigator == 1
                            ? Color(0xFF5D5FEF)
                            : Color(0xFFE5E5E5),
                        height: 25.0,
                        minWidth: 45.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        onPressed: () {
                          if (serviceNavigator != 1)
                            navigator.changeServiceIndex(1);
                          print(initalState);
                          setState(() {
                            initalState = !initalState;
                          });
                          print(initalState);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage('assets/Group 30.png')),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Parlour',
                              style: TextStyle(
                                  color: serviceNavigator == 1
                                      ? Colors.white
                                      : Color(0xFF5D5FEF),
                                  fontWeight: FontWeight.bold),
                            ),
                            if (initalState)
                              Icon(Icons.arrow_right_outlined,
                                  color: Colors.white)
                          ],
                        ),
                      ),
                    if ((initalState == true && serviceNavigator == 2) ||
                        initalState == false)
                      FlatButton(
                        color: serviceNavigator == 2
                            ? Color(0xFF5D5FEF)
                            : Color(0xFFE5E5E5),
                        height: 25.0,
                        minWidth: 45.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        onPressed: () {
                          setState(() {
                            initalState = !initalState;
                          });
                          if (serviceNavigator != 2)
                            navigator.changeServiceIndex(2);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage('assets/Group 32.png')),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Salon',
                              style: TextStyle(
                                  color: serviceNavigator == 2
                                      ? Colors.white
                                      : Color(0xFF5D5FEF),
                                  fontWeight: FontWeight.bold),
                            ),
                            if (initalState)
                              Icon(Icons.arrow_right_outlined,
                                  color: Colors.white)
                          ],
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(height: 15),
              serviceWidget[serviceNavigator]
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
