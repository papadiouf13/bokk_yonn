import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  var searchingLatitude = 14.693425.obs;
  var searchingLongitude = (-17.447938).obs;

  final TextEditingController searchController = TextEditingController();
  final RxList<Marker> markers = <Marker>[].obs;

  void searchLocations(String query) async {
    http.Response response = await http.get(
      Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json'),
    );
    print('Searching for locations with query: $response');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      markers.clear();
      markers.addAll(data.map((location) {
        searchingLatitude.value = double.parse(location['lat']);
        searchingLongitude.value = double.parse(location['lon']);
        return Marker(
          point: LatLng(searchingLatitude.value, searchingLongitude.value),
          builder: (ctx) => Icon(Icons.location_pin),
        );
      }).toList());
    }
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


}
