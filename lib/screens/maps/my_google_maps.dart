import 'dart:async';
import 'dart:convert';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/screens/nurse/nurse_dash_board_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({super.key});

  @override
  State<MyGoogleMap> createState() => MyGoogleMapState();
}

class MyGoogleMapState extends State<MyGoogleMap> {
  LocationController locationController = Get.put(LocationController());
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GoogleMapController? _googleMapController;
  CameraPosition? _kGooglePlex;
  LatLng? selectedLatlng;
  final Set<Marker> _markers = {};

  // Google Places variables11s1
  List<dynamic> placeResults = [];

  @override
  void initState() {
    moveToCurrentLocation();
    super.initState();
  }

  moveToCurrentLocation({bool live = false}) {
    selectedLatlng = locationController.getCurrentLatlng();

    if (live) {
      selectedLatlng = LatLng(
          locationController.currentPosition.value!.latitude,
          locationController.currentPosition.value!.longitude);
    }

    _kGooglePlex = CameraPosition(
      target: LatLng(selectedLatlng!.latitude, selectedLatlng!.longitude),
      zoom: 14.4746,
    );

    _onAddMarkerButtonPressed(selectedLatlng!);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Search for a place",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      searchPlaces(value);
                    } else {
                      setState(() {
                        placeResults = [];
                      });
                    }
                  },
                ),
              ),
              // Place Search Results
              if (placeResults.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: placeResults.length,
                    itemBuilder: (context, index) {
                      final place = placeResults[index];
                      return ListTile(
                        title: Text(place['description']),
                        onTap: () async {
                          await getPlaceDetails(place['place_id']);
                          setState(() {
                            placeResults = [];
                          });
                        },
                      );
                    },
                  ),
                ),

              // Google Map
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      key: Key(
                          "${selectedLatlng!.latitude}-${selectedLatlng!.longitude}"),
                      mapType: MapType.terrain,
                      initialCameraPosition: _kGooglePlex!,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      markers: _markers,
                      onMapCreated: (GoogleMapController controller) async {
                        if (!_controller.isCompleted) {
                          _controller.complete(controller);
                          _googleMapController = await _controller.future;
                        }
                      },
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      onTap: (argument) {
                        selectedLatlng = argument;
                        if (selectedLatlng != null) {
                          _onAddMarkerButtonPressed(selectedLatlng!);
                        }
                      },
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.blueGrey,
                        onPressed: () {
                          moveToCurrentLocation(live: true);
                        }, // Custom location button
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Card(
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: locationController.getAddressFromLatlng(
                              selectedLatlng ??
                                  locationController.getCurrentLatlng()),
                          builder: (context, snap) {
                            String address = snap.data ?? "";
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(address),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            buttonName: "confirm",
                            onPress: () {
                              locationController
                                  .setCurrentLatLng(selectedLatlng!);
                              Get.offAll(() => const NurseDashBoardScreen());
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // Add marker to the map
  _onAddMarkerButtonPressed(LatLng latLng) async {
    logger("_onAddMarkerButtonPressed called");
    if (_markers.isNotEmpty) {
      _markers.clear();
    }

    try {
      logger("_onAddMarkerButtonPressed called try");
      // Get address for the marker
      String address = await locationController.getAddressFromLatlng(latLng);
      // Add the marker
      setState(() {
        _markers.add(Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          infoWindow: InfoWindow(
            title: address,
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
        // Animate the camera
        _moveCamera(latLng);
      });
    } catch (e) {
      logger("Error in _onAddMarkerButtonPressed: $e");
    }
  }

  Future<void> _moveCamera(LatLng? latLng) async {
    logger("_moveCamera called");
    if (latLng == null) {
      debugPrint("LatLng is null. Cannot animate camera.");
      return;
    }

    if (_googleMapController != null) {
      _kGooglePlex = CameraPosition(
        target: LatLng(latLng.latitude, latLng.longitude),
        zoom: 14.4746,
      );
      logger("_moveCamera called ${latLng.latitude} => ${latLng.longitude}");
      setState(() {});
    }
  }

  // Search for places
  Future<void> searchPlaces(String query) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=${mapKey}&components=country:in";
    final response = await http.get(Uri.parse(url));

    logger("searchPlaces url $url");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        placeResults = data['predictions'];
      });
    } else {
      print("Failed to fetch places: ${response.body}");
    }
  }

  // Get place details and move the map
  Future<void> getPlaceDetails(String placeId) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${mapKey}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final location = data['result']['geometry']['location'];
      final latLng = LatLng(location['lat'], location['lng']);

      setState(() {
        selectedLatlng = latLng; // Update selectedLatlng
      });

      // Add marker and move camera to the new location
      await _onAddMarkerButtonPressed(latLng);
    } else {
      print("Failed to fetch place details: ${response.body}");
    }
  }
}
