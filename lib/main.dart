import 'package:bokk_yonn/app/controllers/bottom_navigation_bar_controller.dart';
import 'package:bokk_yonn/app/modules/home/controllers/home_controller.dart';
import 'package:bokk_yonn/app/modules/login/controllers/login_controller.dart';
import 'package:bokk_yonn/app/modules/map/controllers/map_controller.dart';
import 'package:bokk_yonn/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:bokk_yonn/app/modules/payment/controllers/payment_controller.dart';
import 'package:bokk_yonn/app/modules/registration/controllers/registration_controller.dart';
import 'package:bokk_yonn/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:bokk_yonn/app/modules/ride/controllers/ride_controller.dart';
import 'package:bokk_yonn/app/modules/trajet/controllers/trajet_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  initController();
  runApp(
    GetMaterialApp(
      title: "BOK YOON",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
Future<void> initController() async {
  Get.put(OnboardingController());
  Get.put(RegistrationController());
  Get.put(LoginController());
  Get.put(HomeController());
  Get.put(MapControllers());
  Get.put(BottomNavigationBarController());
  Get.put(TrajetController());
  Get.put(RideController());
  Get.put(ReservationController());
  Get.put(PaymentController());
}
