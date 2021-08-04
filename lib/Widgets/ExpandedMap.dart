import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/assistantMethods.dart';
import 'package:freelance_booking_app/Providers/locationProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelance_booking_app/Widgets/NoticeCarousel.dart';

class ExpandedMap extends StatefulWidget {

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  _ExpandedMapState createState() => _ExpandedMapState();
}

class _ExpandedMapState extends State<ExpandedMap> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  GoogleMapController newGoogleMapController;

  Position currentPosition;

  var geoLocator = Geolocator();

  Future locatePosition(BuildContext ctx) async {
    try {
      final locations = Provider.of<LocationProvider>(ctx, listen: false);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition = position;

      LatLng latLngPosition = LatLng(position.latitude, position.longitude);

      CameraPosition cameraPosition =
      new CameraPosition(target: latLngPosition, zoom: 14);
      newGoogleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      await AssistantMethods.searchCoordinateAddress(position)
          .then((value) => locations.addLocation(value));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool expanded=false;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: new SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: deviceHeight * 0.96,
                          width: deviceWidth * 1,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            myLocationEnabled: true,
                            initialCameraPosition: ExpandedMap._kGooglePlex,
                            myLocationButtonEnabled: false,
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: false,
                            onMapCreated: (GoogleMapController controller) async {
                              _controllerGoogleMap.complete(controller);
                              newGoogleMapController = controller;

                              await locatePosition(context);
                            },
                          )
                      ),
                      Column(
                        children: [
                          LocationNameWidget(),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                    Navigator.pop(context); // use this variable to maximise map
                                  },
                                  icon: Icon(Icons.arrow_back, color: Colors.black,)
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.popAndPushNamed(context, '/searchScreen');
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: deviceWidth * 0.8,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.white,
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
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.width * 0.27,
                                    decoration: BoxDecoration(
                                        color: Color(0xff80FFAA),
                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "0",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Doctors",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                Container(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.width * 0.27,
                                    decoration: BoxDecoration(
                                        color: Color(0xff87D3FF),
                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "0",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Parlours",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                Container(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.width * 0.27,
                                    decoration: BoxDecoration(
                                        color: Color(0xffB3C8FF),
                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "0",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Salons",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: deviceHeight*0.35),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.9,
                            color: Colors.black,
                            child: NoticeCarousel(),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
