import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppBackButtonView extends GetView {
  const AppBackButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Row(
        children: [
          Icon(Icons.arrow_back),
          const SizedBox(width: 20),
          AppText(labelle: "Retour")
        ],
      ),
    );
  }
}
