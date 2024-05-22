import 'package:bokk_yonn/app/commons/components/app_button/app_button.dart';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/login/views/login_view.dart';
import 'package:bokk_yonn/app/modules/registration/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationView extends GetView<RegistrationController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/register.png',
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:40),
                      child: AppText(
                        labelle: "S'inscrire",
                        size: 26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:75),
                      child: Container(
                        width: 70,
                        height: 4,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextField(
                  onChanged: (value) => controller.updateEmail(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Entrer votre email/nom d'utilisateur",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) => controller.updateFullName(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Entrer votre nom complet",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) => controller.updatePhone(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Entrer votre téléphone",
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.to(RegistrationView());
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "En vous inscrivant, vous acceptez nos ",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: "conditions générales et politique de confidentialité",
                            style: TextStyle(color: mainColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: AppButton(
                    width: Get.width,
                    backgroundColor: mainColor,
                    borderColor: mainColor,
                    onPressed: (){
                      Get.to(RegistrationView());
                    },
                    child: AppText(
                      labelle: "Continuer",
                      color: white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(LoginView());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              labelle: "Vous êtes déjà inscrit?",
                              color: Colors.black,
                            ),
                            const SizedBox(width: 4),
                            AppText(
                              labelle: "Connecter-vous",
                              color: mainColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
