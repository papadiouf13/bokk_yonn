import 'dart:async';

import 'package:bokk_yonn/app/commons/components/app_bar/app_bar_view.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaymentValidateView extends GetView {
  const PaymentValidateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.off(() => AppBarView());
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
    ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/payment/confirmed.png",
              ),
              SizedBox(height: 16), // Add some space between the image and the text
              Text(
                'Payment Confirmed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
