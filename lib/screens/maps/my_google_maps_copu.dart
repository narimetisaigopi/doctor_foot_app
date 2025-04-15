// import 'dart:async';
// import 'package:drfootapp/controllers/location_controller.dart';
// import 'package:drfootapp/utils/constants/constants.dart';
// import 'package:drfootapp/utils/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MyGoogleMapsScreen extends StatefulWidget {
//   final void Function()? onChanged;
//   final bool updateCurrentLocation;

//   const MyGoogleMapsScreen(
//       {super.key, this.onChanged, this.updateCurrentLocation = false});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyGoogleMapsScreenState createState() => _MyGoogleMapsScreenState();
// }

// class _MyGoogleMapsScreenState extends State<MyGoogleMapsScreen> {
//   GoogleMapController? _controller;
//   // ignore: unused_field
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController searchController = TextEditingController();

//   final LocationController locationController = Get.put(LocationController());
//   Marker? _marker;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initializeLocation();
//     });
//   }

//   Future<void> _initializeLocation() async {
//     locationController.getCurrentLocation().then((value) {
//       setState(() {
//         locationController.selectedLatLng = value;
//       });
//       if (value != null) {
//         updateMapTarget(value);
//       }
//     });
//   }

//   void updateMapTarget(LatLng latLng) {
//     final LatLng target = LatLng(
//       latLng.latitude,
//       latLng.longitude,
//     );
//     _controller?.animateCamera(CameraUpdate.newLatLng(target));
//     setMarker(latLng);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Map"),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(0, 0),
//               zoom: 10,
//             ),
//             markers: _marker != null ? {_marker!} : <Marker>{},
//             onMapCreated: (controller) {
//               _controller = controller;
//             },
//             onTap: (LatLng location) async {
//               locationController.selectedLatLng = location;
//               updateMapTarget(location);
//             },
//           ),
//           if (locationController.selectedLatLng != null)
//             Positioned(
//               bottom: 60,
//               left: 20,
//               child: Column(
//                 children: [
//                   FutureBuilder(
//                       future: locationController.getAddressFromLocation(
//                           locationController.selectedLatLng!),
//                       builder: (context, snapshot) {
//                         String address = "NA";
//                         if (snapshot.hasData && snapshot.data != null) {
//                           address = locationController
//                               .getAddressFromPlacemark(snapshot.data!);
//                         }
//                         return Card(
//                             child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(address),
//                         ));
//                       }),
//                   CustomButton(
//                     width: 120,
//                     buttonName: 'Confirm',
//                     onPress: () {
//                       if (widget.updateCurrentLocation) {
//                         locationController.currentLatLng =
//                             locationController.selectedLatLng;
//                         // Get.put(UserRegistrationController())
//                         //     .updateUserLocation(loginUserModel);
//                       } else {}
//                       Get.back();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   void searchLocation() async {
//     try {
//       List<Location> locations =
//           await locationFromAddress(searchController.text);
//       if (locations.isNotEmpty) {
//         final location = locations.first;
//         _controller?.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: LatLng(location.latitude, location.longitude),
//             zoom: 15,
//           ),
//         ));
//       }
//     } catch (e) {
//       logger(e);
//     }
//   }

//   void setMarker(LatLng position) {
//     setState(() {
//       _marker = Marker(
//         markerId: const MarkerId('marker_id'),
//         position: position,
//         icon: BitmapDescriptor.defaultMarker, // Customize the marker icon here
//       );
//     });
//   }
// }
