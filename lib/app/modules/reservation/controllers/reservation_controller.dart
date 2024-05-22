import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class ReservationController extends GetxController {
  var isDefault = true.obs;
  var depart = ''.obs;
  var arrive = ''.obs;
  var selectedIndex = (-1).obs;

  void toggleDefault(bool value) {
    isDefault.value = value;
  }

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  Future<void> setDepartFromCoordinates(double latitude, double longitude) async {
    depart.value = await getCity(latitude, longitude);
  }

  Future<void> setArriveFromCoordinates(double latitude, double longitude) async {
    arrive.value = await getCity(latitude, longitude);
  }

  Future<String> getCity(double latitude, double longitude) async {
    try {
      String val = "Unknown location";
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        val = "${place.locality}, ${place.street}";
      }
      return val;
    } catch (e) {
      print("Error: $e");
      return "Unknown location"; // Ensure a string is returned in case of error
    }
  }
}
