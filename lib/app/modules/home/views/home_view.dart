import 'package:bokk_yonn/app/commons/components/app_button/app_button.dart';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/home/controllers/home_controller.dart';
import 'package:bokk_yonn/app/modules/map/views/map_view.dart';
import 'package:bokk_yonn/app/modules/registration/views/registration_view.dart';
import 'package:bokk_yonn/app/modules/reservation/views/reservation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  final RxList<String> addresses = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapView(
          searchingLatitude: controller.searchingLatitude.value,
          searchingLongitude: controller.searchingLongitude.value,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _searchController.clear();
                          },
                          child: Icon(Icons.highlight_remove_sharp),
                        ),
                      ),
                      onChanged: (value) {
                        controller.searchLocations(value);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                AppButton(
                  radius: 100.0,
                  width: 70.0,
                  height: 40.0,
                  backgroundColor: mainColor,
                  borderColor: mainColor,
                  onPressed: (){
                    Get.to(ReservationView());
                  },
                  child: AppText(
                    labelle: "search",
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
