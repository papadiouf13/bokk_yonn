import 'package:bokk_yonn/app/commons/components/app_button/app_back_button_view.dart';
import 'package:bokk_yonn/app/modules/trajet/views/trajet_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trajet_controller.dart';

class TrajetView extends GetView<TrajetController> {
  const TrajetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: Obx(() {
        if (controller.trips.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.trips.length,
            itemBuilder: (context, index) {
              final trip = controller.trips[index];
              return TrajetCard(trip: trip);
            },
          );
        }
      }),
    );
  }
}
