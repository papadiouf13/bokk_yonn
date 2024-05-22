import 'package:bokk_yonn/app/data/models/ride.dart';
import 'package:get/get.dart';


class RideController extends GetxController {
  var totalRides = 13.obs;
  var totalCost = 910.25.obs;
  var selectedDate = DateTime.now().obs;

  var rideHistory = <Ride>[
    Ride(driverName: "Michael S", driverImage: "assets/images/profile.png", fare: 50.0, distance: 2.2, rating: 4.7),
    Ride(driverName: "Aeesha L", driverImage: "assets/images/profile.png", fare: 70.0, distance: 4.5, rating: 4.8),
    Ride(driverName: "Laila M", driverImage: "assets/images/profile.png", fare: 120.0, distance: 10.0, rating: 4.3),
  ].obs;


  List<DateTime> getDaysOfWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }
}