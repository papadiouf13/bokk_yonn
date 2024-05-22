import 'package:bokk_yonn/app/commons/components/app_button/app_button.dart';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/home/controllers/home_controller.dart';
import 'package:bokk_yonn/app/modules/map/controllers/map_controller.dart';
import 'package:bokk_yonn/app/modules/payment/views/payment_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  ReservationView({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final MapControllers mapController = Get.put(MapControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<String>(
              future: controller.getCity(mapController.latitude.value, mapController.longitude.value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: mainColor,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Depart:'),
                          Text(snapshot.data ?? 'Unknown location'),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            FutureBuilder<String>(
              future: controller.getCity(homeController.searchingLatitude.value, homeController.searchingLongitude.value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: mainColor,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Arriver:'),
                          Text(snapshot.data ?? 'Unknown location'),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 70),
            AppText(
              labelle: "Parcours disponible",
              size:16,
            ),
         /*
            Row(
              children: [
                Obx(() => ChoiceChip(
                  label: Text('Par défaut'),
                  selected: controller.isDefault.value,
                  onSelected: (selected) {
                    controller.toggleDefault(selected);
                  },
                )),
                SizedBox(width: 8),
                Obx(() => ChoiceChip(
                  label: Text('Carte'),
                  selected: !controller.isDefault.value,
                  onSelected: (selected) {
                    controller.toggleDefault(!selected);
                  },
                )),
              ],
            ),*/
            SizedBox(height: 16),
            Expanded(
              child: Obx(() => ListView(
                children: [
                  Card(
                    margin: EdgeInsets.all(10),
                    color: controller.selectedIndex.value == 0 ? secondGreyColor : null,
                    child: ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text('Keur Massar'),
                      subtitle: Text('5 mins - 2 seats'),
                      trailing: Text('0f/km'),
                      onTap: () {
                        controller.selectItem(0);
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: controller.selectedIndex.value == 1 ? secondGreyColor: null,
                    child: ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text('Thiaroye'),
                      subtitle: Text('8 mins - 2 seats'),
                      trailing: Text('7f/km'),
                      onTap: () {
                        controller.selectItem(1);
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: controller.selectedIndex.value == 2 ? secondGreyColor : null,
                    child: ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text('Yarakh'),
                      subtitle: Text('2 mins - 1 seat'),
                      trailing: Text('0f/km'),
                      onTap: () {
                        controller.selectItem(2);
                      },
                    ),
                  ),
                ],
              )),
            ),
            Obx(() => AppButton(
              width: Get.width,
              backgroundColor: (controller.selectedIndex.value >= 0 && controller.selectedIndex.value <= 2) ? mainColor : greyColor,
              borderColor: (controller.selectedIndex.value >= 0 && controller.selectedIndex.value <= 2) ? mainColor : greyColor,
              onPressed: (){
                if(controller.selectedIndex.value >= 0 && controller.selectedIndex.value <= 2){
                  Get.to(PaymentView());
                }
              },
              child: AppText(
                labelle: "Continuer",
                color: white,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
