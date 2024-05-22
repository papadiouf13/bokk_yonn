import 'package:bokk_yonn/app/modules/login/views/login_view.dart';
import 'package:bokk_yonn/app/modules/ride/views/ride_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'menu_item_view.dart';

class DrawerContentView extends GetView {
  const DrawerContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3E6F9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.png")
            ),
            SizedBox(height: 10),
            Text(
              'Moussa Sagna',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'sagna***@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.black26),
            MenuItem(title: 'Profile', onTap: () {}),
            Divider(color: Colors.black26),
            MenuItem(title: 'Historique des voyage', onTap: () {
              Get.to(RideView());
            }),
            Divider(color: Colors.black26),
            MenuItem(title: 'À propos', onTap: () {}),
            Divider(color: Colors.black26),
            MenuItem(title: 'Aide', onTap: () {}),
            Divider(color: Colors.black26),
            MenuItem(title: 'Déconnecter', onTap: () {
              Get.to(LoginView());
            }),
            Divider(color: Colors.black26),
          ],
        ),
      ),
    );
  }
}
