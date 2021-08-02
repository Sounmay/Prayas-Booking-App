import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/navigationProvider.dart';
import 'package:provider/provider.dart';
import 'package:freelance_booking_app/Widgets/MapWidget.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:freelance_booking_app/Widgets/myDrawer.dart';
import 'package:freelance_booking_app/Widgets/NoticeCarousel.dart';

class Home extends StatefulWidget {
  final Function openDrawer;
  Home(this.openDrawer);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final navigator = Provider.of<NavigationProvider>(context);
    bool expanded = false;
    super.build(context);
    return Scaffold(
        endDrawer: Mydrawer(),
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
                    width: deviceWidth * 0.9,
                    height: deviceHeight * 0.1,
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/searchScreen');
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          width: deviceWidth * 0.72,
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
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            padding: EdgeInsets.all(0),
                            color: Color(0xFF5D5FEF),
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () => widget.openDrawer()),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Text(
                        'Services near you (5 km radius)',
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
                    width: MediaQuery.of(context).size.width * 0.9,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Colors.white,
                    child: NoticeCarousel(),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => false;
}
