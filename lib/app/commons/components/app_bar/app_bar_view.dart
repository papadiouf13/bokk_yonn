import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/commons/constantes/pages/pages.dart';
import 'package:bokk_yonn/app/controllers/bottom_navigation_bar_controller.dart';
import 'package:bokk_yonn/app/views/views/drawer_content_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarView extends GetView<BottomNavigationBarController> {
  AppBarView ({
    super.key,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: white,
        drawer: Drawer(
            width: 350,
            child: DrawerContentView()
        ),
        body : Obx(()=>pages[controller.selectedIndex.value]),
        bottomNavigationBar:
        Obx(() => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(color: mainColor, fontWeight: FontWeight.w600)
                  : const TextStyle(color: Colors.black),
            ),
          ),
          child: NavigationBar(

            selectedIndex: controller.selectedIndex.value,
            indicatorColor: Colors.transparent,
            backgroundColor: white,
            onDestinationSelected: (index) {
              if (index == 3) {
                _scaffoldKey.currentState?.openDrawer();
              } else {
                controller.selectedIndex.value = index;
              }
            },
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  "assets/icones/home.png",
                  height: 25,
                  color: controller.selectedIndex.value == 0 ? mainColor : Colors.grey,
                ),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "assets/icones/trajet.png", height: 25,
                  color: controller.selectedIndex.value == 1 ? mainColor : Colors.grey,
                ),
                label: 'Trajets',

              ),
              NavigationDestination(
                icon: Image.asset("assets/icones/message.png", height: 25,
                  color: controller.selectedIndex.value == 2 ? mainColor : Colors.grey,
                ),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Image.asset("assets/icones/menu.png",
                  height: 25,
                  color: controller.selectedIndex.value == 3 ? mainColor : Colors.grey,
                ),
                label: 'Menu',
              ),
            ],

          ),
        ),
        )
    );
  }
}