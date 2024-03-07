import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
  static CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(17.123184, 79.208824), zoom: 5);
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Location"),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
    );
  }
}
