import 'package:bokk_yonn/app/commons/components/app_button/app_button.dart';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/home/views/home_view.dart';
import 'package:bokk_yonn/app/modules/login/views/login_view.dart';
import 'package:bokk_yonn/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:bokk_yonn/app/modules/registration/views/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          backgroundColor: white,
          body: PageView.builder(
            itemCount: controller.images.length,
            controller: PageController(initialPage: controller.currentIndex.value),
            onPageChanged: (index) {
              controller.currentIndex.value = index;
            },
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset(
                      controller.images[controller.currentIndex.value],
                      height: 400,
                    ),
                    const SizedBox(height: 30),
                    AppText(
                      labelle: controller.title.value,
                      color: secondaryColor,
                      size: 30,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: Get.height / 3,
                      child: AppText(
                        labelle: controller.subTitle.value,
                        color: greyColor,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildIndicators(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                      child: Column(
                        children: [
                          AppButton(
                            width: Get.width,
                            backgroundColor: mainColor,
                            borderColor: mainColor,
                            onPressed: (){
                              Get.off(LoginView());
                            },
                            child: AppText(
                              labelle: "Commençons",
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  List<Widget> buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < controller.images.length; i++) {
      indicators.add(
        GestureDetector(
          onTap: () {
            controller.currentIndex.value = i;
          },
          child: Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: controller.currentIndex.value == i ? mainColor : Colors.grey,
            ),
          ),
        ),
      );
    }
    return indicators;
  }
}