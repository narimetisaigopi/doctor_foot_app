import 'package:drfootapp/utils/constants/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  Position? currentPosition;
  LatLng? currentLatLng;
  Placemark? currentPlacemark;
  LatLng? selectedLatLng;

  Future<LatLng?> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      currentPosition = await Geolocator.getCurrentPosition();
      if (currentPosition != null) {
        currentLatLng =
            LatLng(currentPosition!.latitude, currentPosition!.longitude);
        currentPlacemark = await getAddressFromLocation(currentLatLng!);
        update();
      }

      return currentLatLng;
    } catch (e) {
      logger("determinePosition $e");
      return currentLatLng;
    } finally {}
  }

  Future<Placemark> getAddressFromLocation(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    return placemarks.first;
  }

  String getAddressFromPlacemark(Placemark placemark) {
    String address =
        '${placemark.name}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
    return address;
  }

  Future<String> getAddressForCurrentLocation(LatLng latlng) async {
    String address = "";
    Placemark placeMark = await getAddressFromLocation(latlng);
    address = getAddressFromPlacemark(placeMark);
    update();
    return address;
  }
}
