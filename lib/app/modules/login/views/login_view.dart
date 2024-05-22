import 'dart:ffi';

import 'package:bokk_yonn/app/commons/components/app_bar/app_bar_view.dart';
import 'package:bokk_yonn/app/commons/components/app_button/app_button.dart';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/home/views/home_view.dart';
import 'package:bokk_yonn/app/modules/registration/views/registration_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login.png',
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: AppText(
                      labelle: "Se connecter",
                      size: 26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:100),
                    child: Container(
                      width: 70,
                      height: 4,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Entrer votre email/nom d'utilisateur",
                ),
              ),
              const SizedBox(height: 10),
              Obx(()=> TextField(
                controller: passwordController,
                obscureText: controller.showPassword.value,
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Entrer votre mot de passe",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.showPassword.value = !controller.showPassword.value;
                    },
                    child: Icon(Icons.visibility_off),
                  ),
                ),
              )),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgotten password
                  },
                  child: Text(
                    "Mot de passe oublié?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child:  AppButton(
                  width: Get.width,
                  backgroundColor: mainColor,
                  borderColor: mainColor,
                  onPressed: () async {
                    var success = await controller.login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (success) {
                      Get.off(AppBarView());
                    } else {
                      Get.snackbar('Error', 'Invalid credential');
                    }
                  },
                  child: AppText(
                    labelle: "Continuer",
                    color: white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width:Get.width/2 -60,height: 1, color: greyColor),
                    const Center(
                      child: Text('OR', style: TextStyle(color: Colors.grey)),
                    ),
                    Container(width:Get.width/2 - 60,height: 1, color: greyColor),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {
                  },
                  icon: Image.asset(
                    'assets/icones/google.png',
                    height: 24,
                    width: 24,
                  ),
                  label: AppText(
                      labelle: 'Se connecter avec Google',
                      color: Colors.black,
                  ),
                  style: OutlinedButton.styleFrom(
                   // backgroundColor: secondGreyColor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(RegistrationView());
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Pas de compte? ",
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Inscrivez-vous",
                          style: TextStyle(color: mainColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
