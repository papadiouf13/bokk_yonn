import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  //TODO: Implement BottomNavigatioBarControllerController

  final count = 0.obs;
  RxInt selectedIndex = 0.obs;

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
