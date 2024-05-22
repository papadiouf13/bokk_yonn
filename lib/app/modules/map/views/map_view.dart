import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapControllers> {
  final RxDouble searchingLatitude;
  final RxDouble searchingLongitude;

  MapView({
    double searchingLatitude = 14.693425,
    double searchingLongitude = -17.447938,
    Key? key,
  })  : searchingLatitude = searchingLatitude.obs,
        searchingLongitude = searchingLongitude.obs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      FlutterMap(
          options: MapOptions(
            center: LatLng(controller.latitude.value, controller.longitude.value),
            zoom: 14.0,
          ),
      children: [
        TileLayer(
        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
        MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(controller.latitude.value, controller.longitude.value),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ),
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(searchingLatitude.value, searchingLongitude.value),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.green,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
