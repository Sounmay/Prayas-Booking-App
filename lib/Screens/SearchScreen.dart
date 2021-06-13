import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LocationNameWidget(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: deviceWidth * 0.9,
                height: deviceHeight * 0.1,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(children: [
                  // Container(
                  //   width: deviceWidth * 0.7,
                  //   child: TextFormField(
                  //       keyboardType: TextInputType.text,
                  //       decoration: InputDecoration(
                  //           prefixIcon: new Icon(Icons.search),
                  //           contentPadding: EdgeInsets.all(10),
                  //           hintText: 'Search for a service',
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: Colors.grey, width: 1.0),
                  //               borderRadius: BorderRadius.only(
                  //                   topLeft: Radius.circular(6),
                  //                   bottomLeft: Radius.circular(6))),
                  //           focusedBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: Colors.black, width: 2.0),
                  //               borderRadius: BorderRadius.only(
                  //                   topLeft: Radius.circular(6),
                  //                   bottomLeft: Radius.circular(6)))),
                  //       onChanged: (val) {}),
                  // ),
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
                        onPressed: () {}),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
