import 'dart:async';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/home/views/home_view.dart';
import 'package:bokk_yonn/app/modules/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
       Get.off(() => const OnboardingView());
    });
    return Scaffold(
      backgroundColor: thirdColor,
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo/splash.png",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: AppText(
              labelle: "BOK YOON",
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              size: 16
            ),
          )
        ],
      ),
    );
  }
}
