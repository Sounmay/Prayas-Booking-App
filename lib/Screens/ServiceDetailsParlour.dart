import 'dart:ui';
import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Widgets/ServiceDetailsFacilityGrid.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';

class ServiceDetailsParlour extends StatefulWidget {
  @override
  _ServiceDetailsParlourState createState() => _ServiceDetailsParlourState();
}

class _ServiceDetailsParlourState extends State<ServiceDetailsParlour> {
  bool isLoading = true;
  Location location;
  Details details;
  List<EmployeeDetailList> employeeDetailList;
  List<ParlourServiceDetails> parlourServiceDetails;
  List<ParlourSlotDetails> slotList;
  int getCatalogue = 1;

  Future _loadDatafromFirestore(String uid) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('ParlourServices')
          .doc(uid)
          .get();
      setState(() {
        location = Location.fromJson(data.data()['location']);
        details = Details.fromJson(data.data()['details']);
        final ds = data.data()['employeeDetails'];
        print(ds);
        employeeDetailList = List.from(data
            .data()['employeeDetails']
            .map((e) => EmployeeDetailList.fromJson(e)));
        parlourServiceDetails = List.from(data
            .data()['servicesList']
            .map((e) => ParlourServiceDetails.fromJson(e)));
        slotList = List.from(
            data.data()['slotList'].map((e) => ParlourSlotDetails.fromJson(e)));
        isLoading = false;
        firstLoad = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  bool firstLoad = true;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    Parlour service = args['details'];

    final int employeeNumbers = employeeDetailList?.length ?? 0;
    /*print(employeeNumbers);*/

    if (firstLoad) {
      _loadDatafromFirestore(service.id);
    }
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: isLoading == true
          ? Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ),
              ),
            )
          : Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(68),
                  child: AppBar(
                    title: Text('Parlour \nServices'),
                    actions: [
                      Padding(
                          padding: const EdgeInsets.only(right: 5, top: 5),
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF0F2735),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('assets/parlour.png')))
                    ],
                  )),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            height: 70,
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    prefixIcon: new Icon(Icons.search),
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'Personal Number',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(6)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                onChanged: (val) {}),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: details.parlourImage,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * 0.28,
                              width: MediaQuery.of(context).size.width * 0.6,
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.64,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFF0F2735),
                              ),
                              margin: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      CupertinoIcons.location,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Marquee(
                                          velocity: 20,
                                          text: location.address,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              fontWeight: FontWeight.w400)),
                                    )
                                  ]),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.64,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Icon(
                                    CupertinoIcons.scissors,
                                    size: 24,
                                  ),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Text(service.parlourName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff5D5FEF)),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text('\u{2B50} 4.4',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: employeeDetailList.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: new NetworkImage(
                                              employeeDetailList[index]
                                                  .imagefile),
                                          backgroundColor: Colors.grey[200],
                                          /*child: new Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 0),
                                              decoration: new BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: new NetworkImage(
                                                          employeeDetailList[
                                                                  index]
                                                              .imagefile))))*/
                                        ),
                                        new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Text(
                                              employeeDetailList[index].name,
                                            ),
                                            new Text(
                                              employeeDetailList[index].number,
                                              style: TextStyle(
                                                  color: Color(0xff5D5FEF),
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.64,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              // height: MediaQuery.of(context).size.height * 0.05,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Icon(
                                          CupertinoIcons.time,
                                          color: Color(0xff5D5FEF),
                                          size: 20,
                                        ),
                                        Text(
                                          'Visiting hour',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ]),
                                      Text(service.time,
                                          style: TextStyle(
                                              color: Color(0xff00A676),
                                              fontSize: 12))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Icon(
                                          CupertinoIcons.sun_min,
                                          color: Color(0xff5D5FEF),
                                          size: 23,
                                        ),
                                        Text(
                                          'Days',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ]),
                                      Text(slotList[0].weekRange,
                                          style: TextStyle(
                                              color: Color(0xff00A676),
                                              fontSize: 12))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.37,
                                    child: TextButton(
                                      child: Text(
                                        'Get Catalogue',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color(0xff02CF96),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/cat',
                                            arguments: {
                                              'id': service.id,
                                              'shopName': service.parlourName,
                                              'mostAvailed':
                                                  parlourServiceDetails,
                                              'getCatalogue': getCatalogue
                                            });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: TextButton(
                                      child: Text(
                                        'Book an appointment',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color(0xff5D5FEF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/bookAppointment',
                                            arguments: {
                                              'employeeNumbers':
                                                  employeeNumbers,
                                              'id': service.id,
                                              'shopName': service.parlourName,
                                              'mostAvailService':
                                                  parlourServiceDetails,
                                              'slots': slotList,
                                              'address': service.location,
                                            });
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                          ServiceDetailsFacilityGrid(),
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: Text('See Gallery'),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
