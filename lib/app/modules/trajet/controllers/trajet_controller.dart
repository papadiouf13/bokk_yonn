import 'package:bokk_yonn/app/data/models/trip.dart';
import 'package:get/get.dart';

class TrajetController extends GetxController {
  var trips = <Trip>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrips();
  }

  void fetchTrips() {
    trips.value = [
      Trip(title: 'Dakar-Yoff', date: '01/05/2025', passengers: 2),
      Trip(title: 'Dakar-Thies', date: '01/05/2025', passengers: 2),
      Trip(title: 'Ouakam-Ville', date: '01/05/2025', passengers: 2),
    ];
  }
}
