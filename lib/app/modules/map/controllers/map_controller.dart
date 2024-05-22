import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class MapControllers extends GetxController {
  var latitude = 14.693425.obs;
  var longitude = (-17.447938).obs;
  var markers = <Marker>[].obs;
  var polylines = <Polyline>[].obs;


  @override
  void onInit() {
    super.onInit();
    determinePosition();
    getPosition();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);

    return await Geolocator.getCurrentPosition();
  }
  getPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(position);
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      print(longitude.value);
      print(latitude.value);
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}



