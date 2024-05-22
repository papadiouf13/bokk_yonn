import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSearchButton extends GetView<HomeController> {
  final void Function()? onTap;

  AppSearchButton({
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 70,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
                labelle: "Rechercher",
                fontWeight: FontWeight.normal,
                color: white,
                size: 22
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/icons/car.png")
          ],
        ),
      ),
    );
  }
}
