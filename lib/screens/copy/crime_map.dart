import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CrimeMap2 extends StatefulWidget {
  const CrimeMap2({Key? key}) : super(key: key);

  @override
  State<CrimeMap2> createState() => _CrimeMap2State();
}

class _CrimeMap2State extends State<CrimeMap2> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
        },
      ) ,
    );
  }
}
