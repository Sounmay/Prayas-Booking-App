import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:freelance_booking_app/Providers/assistantMethods.dart';


class LocationNameWidget extends StatelessWidget {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  Position currentPosition;
  var geoLocator = Geolocator();

  void locationName() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
    new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String address = await AssistantMethods.searchCoordinateAddress(position);
    //variable to be returned
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width * 1,
      color: Colors.black,
      child: Row(
        children: [
          Icon(CupertinoIcons.location),
          Text(
            ""
            //return the variable address here
          )
        ],
      ),
    );
  }
}
