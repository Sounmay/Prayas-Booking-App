import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/User.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:provider/provider.dart';
import 'package:freelance_booking_app/Widgets/MapWidget.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AppUser>(context, listen: false);
    final navigator = Provider.of<NavigationProvider>(context, listen: false);

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
              SizedBox(
                height: 20.0,
              ),
              MapWidget(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(children: [
                  Text(
                    'Services provided by us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5D5FEF),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
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
                        navigator.changeWidgetIndex(2);
                        navigator.changeServiceIndex(0);
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            color: Color(0xFF5D5FEF),
                            height: 25.0,
                            minWidth: 45.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: BorderSide(
                                    color: Color(0xFF5D5FEF),
                                    width: 1,
                                    style: BorderStyle.solid)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        navigator.changeWidgetIndex(2);
                        navigator.changeServiceIndex(1);
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            color: Color(0xFF5D5FEF),
                            height: 25.0,
                            minWidth: 45.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: BorderSide(
                                    color: Color(0xFF5D5FEF),
                                    width: 1,
                                    style: BorderStyle.solid)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        navigator.changeWidgetIndex(2);
                        navigator.changeServiceIndex(2);
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            color: Color(0xFF5D5FEF),
                            height: 25.0,
                            minWidth: 45.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: BorderSide(
                                    color: Color(0xFF5D5FEF),
                                    width: 1,
                                    style: BorderStyle.solid)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'General Information',
                    style: TextStyle(
                      color: Color(0xFF5D5FEF),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
