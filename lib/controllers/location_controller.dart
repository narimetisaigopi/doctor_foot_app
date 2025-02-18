import 'package:drfootapp/utils/constants/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  Rx<Position?> currentPosition = Rx<Position?>(null);
  Rx<LatLng?> _currentLatLng = Rx<LatLng?>(null);
  Rx<Placemark?> currentPlacemark = Rx<Placemark?>(null);

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

      Position position = await Geolocator.getCurrentPosition();
      currentPosition.value = position;

      // Update LatLng and Placemark
      LatLng latLng = LatLng(position.latitude, position.longitude);
      await setCurrentLatLng(latLng);
      update();

      return latLng;
    } catch (e) {
      logger("determinePosition $e");
      return null;
    } finally {}
  }

  Future<Placemark?> getPlacemarkFromLatlng(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if (placemarks.isNotEmpty) {
      return placemarks.first;
    }
    return null;
  }

  Future<String> getAddressFromLatlng(LatLng? latLng) async {
    if (latLng == null) return "";
    Placemark? placemark = await getPlacemarkFromLatlng(latLng);
    if (placemark != null) {
      return getFormattedAddress(placemark);
    }
    return "";
  }

  String getFormattedAddress(Placemark? placemark, {bool userCurrent = false}) {
    if (placemark == null) {
      return "Address not available";
    }

    // Build the address using available Placemark properties
    return [
      placemark.street,
      placemark.locality,
      placemark.subAdministrativeArea,
      placemark.administrativeArea,
      // placemark.postalCode,
      // placemark.country,
    ].where((element) => element != null && element.isNotEmpty).join(", ");
  }

  String getCity() {
    String location = "";
    if (currentPlacemark.value != null) {
      location = currentPlacemark.value!.locality ?? "";
    }
    return location;
  }

  setCurrentLatLng(LatLng latLng) async {
    _currentLatLng.value = latLng;
    currentPlacemark.value = await getPlacemarkFromLatlng(latLng);
  }

  LatLng getCurrentLatlng() {
    LatLng latLng = const LatLng(0.0, 0.0);
    if (_currentLatLng.value != null) {
      latLng = _currentLatLng.value ?? const LatLng(0.0, 0.0);
    }
    return latLng;
  }
}
