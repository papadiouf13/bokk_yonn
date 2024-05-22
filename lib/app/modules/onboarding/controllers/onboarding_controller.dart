import 'dart:async';

import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final count = 0.obs;
  var title = "".obs;
  var subTitle = "".obs;
  var currentIndex = 0.obs;
  var timer;
  final List<String> images = [
    'assets/onboarding/first.png',
    'assets/onboarding/second.png',
    'assets/onboarding/third.png',
  ];

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      currentIndex.value = (currentIndex.value + 1) % images.length;
      switch(currentIndex.value){
        case 0:
          title.value = "Trouver une voiture";
          subTitle.value = "Un chauffeur à proximité vient vous chercher";
          break;
        case 1:
          title.value = "Suivi en temps réel";
          subTitle.value = "Suivez l’emplacement de votre chauffeur sur la carte";
          break;
        case 2:
          title.value = "Gagner de l’argent";
          subTitle.value = "Amener des gens lors de vos trajet et gagner de l’argent";
          break;
        default:
          break;
      }
    });
  }

}
