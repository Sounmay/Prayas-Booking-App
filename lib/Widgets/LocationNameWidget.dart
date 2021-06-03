import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelance_booking_app/Providers/locationProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:freelance_booking_app/Providers/assistantMethods.dart';
import 'package:provider/provider.dart';

class LocationNameWidget extends StatefulWidget {
  @override
  _LocationNameWidgetState createState() => _LocationNameWidgetState();
}

class _LocationNameWidgetState extends State<LocationNameWidget> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  GoogleMapController newGoogleMapController;

  Position currentPosition;

  var geoLocator = Geolocator();

  Future location;

  // Future<String> locationName() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   currentPosition = position;

  //   LatLng latLngPosition = LatLng(position.latitude, position.longitude);
  //   CameraPosition cameraPosition =
  //       new CameraPosition(target: latLngPosition, zoom: 14);
  //   newGoogleMapController
  //       .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  //   String address = await AssistantMethods.searchCoordinateAddress(position);
  //   //variable to be returned
  //   return address;
  // }

  @override
  Widget build(BuildContext context) {
    final locations = Provider.of<LocationProvider>(context).address;
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width * 1,
      color: Color(0xff0F2735),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.location,
            color: Colors.blue,
          ),
          SizedBox(width: 10,),
          Center(
            child: Text(
              locations != null && locations.length != 0
                  ? locations[0].address
                  : "",
              style: TextStyle(color: Colors.white,
                  fontSize: 13),
              //return the variable address here
            ),
          )
        ],
      ),
    );
  }
}
