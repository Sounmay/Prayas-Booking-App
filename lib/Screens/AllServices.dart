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

class AllSerives extends StatefulWidget {
  int serviceIndex;
  AllSerives({this.serviceIndex});
  @override
  _AllSerivesState createState() => _AllSerivesState();
}

class _AllSerivesState extends State<AllSerives> {
  bool initalState = true;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final navigator = Provider.of<NavigationProvider>(context);
    final serviceNavigator =
        Provider.of<NavigationProvider>(context).serviceIndex;
    final medicalservicesList = Provider.of<MedicalServices>(context).services;
    final parlourservicesList = Provider.of<ParlourServices>(context).services;
    final serviceservicesList = Provider.of<SalonServices>(context).services;
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
        // appBar: AppBar(
        //   title: Text('Home'),
        //   leading: InkWell(
        //       onTap: () {
        //         FirebaseAuth.instance.signOut();
        //       },
        //       child: Icon(Icons.logout)),
        // ),
        body: SafeArea(
      child: Container(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LocationNameWidget(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 70,
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: new Icon(Icons.search),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Search for a service',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(6))),
                    onChanged: (val) {}),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 20.0),
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
